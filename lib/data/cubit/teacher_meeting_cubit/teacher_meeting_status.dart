abstract class TeacherMeetingState {}

class TeacherMeetingInitial extends TeacherMeetingState {}

class TeacherMeetingLoading extends TeacherMeetingState {}

class TeacherChannelCreated extends TeacherMeetingState {
  final String channelName;

  TeacherChannelCreated(this.channelName);
}

class TeacherMeetingError extends TeacherMeetingState {
  final String message;

  TeacherMeetingError(this.message);
}
