import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/student_meeting_cubit/student_meeting_status.dart';
import 'package:permission_handler/permission_handler.dart';

const String appId = 'YOUR_APP_ID'; 
 String token =''; 

class StudentMeetingCubit extends Cubit<StudentMeetingState> {
  late RtcEngine _engine;
  String? _channelName;
  int? _remoteUid;

  StudentMeetingCubit() : super(StudentMeetingInitial());

  Future<void> joinChannel(String channelName) async {
    emit(StudentMeetingLoading());
    try {
      await [Permission.microphone, Permission.camera].request();

      _engine = createAgoraRtcEngine();
      await _engine.initialize(const RtcEngineContext(appId: appId));
      _engine.registerEventHandler(RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          emit(StudentChannelJoined());
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          emit(StudentRemoteJoined(remoteUid));
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          emit(StudentRemoteLeft());
        },
      ));
     ChannelMediaOptions options = const ChannelMediaOptions(
        publishScreenCaptureAudio: true,
        publishCameraTrack: true,
        publishCustomAudioTrack: true,
      );
      await _engine.joinChannel(token: token, channelId: channelName, uid: 0, options: options);
      _channelName = channelName;
    } catch (e) {
      emit(StudentMeetingError('Failed to join channel'));
    }
  }

  void leaveChannel() {
    _engine.leaveChannel();
    _engine.destroyCustomEncodedVideoTrack(0);
    emit(StudentLeftChannel());
  }
}
