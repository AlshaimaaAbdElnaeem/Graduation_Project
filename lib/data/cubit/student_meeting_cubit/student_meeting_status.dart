abstract class StudentMeetingState {}

class StudentMeetingInitial extends StudentMeetingState {}

class StudentMeetingLoading extends StudentMeetingState {}

class StudentChannelJoined extends StudentMeetingState {}

class StudentRemoteJoined extends StudentMeetingState {
  final int remoteUid;

  StudentRemoteJoined(this.remoteUid);
}

class StudentRemoteLeft extends StudentMeetingState {}

class StudentLeftChannel extends StudentMeetingState {}

class StudentMeetingError extends StudentMeetingState {
  final String message;

  StudentMeetingError(this.message);
}
