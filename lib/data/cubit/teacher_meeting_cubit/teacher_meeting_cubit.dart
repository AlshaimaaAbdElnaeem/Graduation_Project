import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/teacher_meeting_cubit/teacher_meeting_status.dart';
import 'package:graduation_project/ui/constant.dart';


class TeacherMeetingCubit extends Cubit<TeacherMeetingState> {
  final CollectionReference _channelsCollection =
      FirebaseFirestore.instance.collection(kChannels);

  TeacherMeetingCubit() : super(TeacherMeetingInitial());

  Future<void> createChannelAndJoin(String channelName) async {
    emit(TeacherMeetingLoading());
    try {
      await _channelsCollection.doc(channelName).set({
        'channelName': channelName,
        'createdAt': FieldValue.serverTimestamp(),
      });
      emit(TeacherChannelCreated(channelName));
    } catch (e) {
      emit(TeacherMeetingError('Failed to create channel'));
    }
  }
}
