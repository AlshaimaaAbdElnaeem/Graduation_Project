import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:graduation_project/data/cubit/meeting_cubit/meeting_status.dart';

class MeetingCubit extends Cubit<MeetingState> {
  final String appId = 'ed56be5e82ae4b7aae48a7fcf699f3e7';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late RtcEngine _engine;

  MeetingCubit() : super(MeetingInitial()) {
    _engine = createAgoraRtcEngine();
    _initializeAgora();
  }

  void _initializeAgora() async {
    await _engine.initialize(RtcEngineContext(appId: appId));
  }

  Future<void> createMeeting(String meetingName) async {
    emit(MeetingLoading());
    try {
      DocumentReference meetingRef =
          await _firestore.collection('meetings').add({
        'name': meetingName,
        'createdAt': FieldValue.serverTimestamp(),
      });
      emit(MeetingCreated(meetingName, meetingRef.id));
    } catch (e) {
      emit(MeetingError(e.toString()));
    }
  }

  Future<void> joinMeeting(String meetingId) async {
    emit(MeetingLoading());
    try {
      DocumentSnapshot doc =
          await _firestore.collection('meetings').doc(meetingId).get();
      if (doc.exists) {
        emit(MeetingJoined(doc['name'], meetingId));
        await _joinAgoraChannel(meetingId);
      } else {
        emit(MeetingError("Meeting not found"));
      }
    } catch (e) {
      emit(MeetingError(e.toString()));
    }
  }

  ChannelMediaOptions options = const ChannelMediaOptions(
    publishCameraTrack: true,
    publishCustomAudioTrack: true,
  );
  Future<void> _joinAgoraChannel(String channelId) async {
    await _engine.joinChannel(
        token: '', channelId: channelId, uid: 0, options: options);
  }

  @override
  Future<void> close() {
    _engine.leaveChannel();
    _engine.destroyCustomEncodedVideoTrack(0);
    return super.close();
  }
}
