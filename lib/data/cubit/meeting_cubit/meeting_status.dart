
abstract class MeetingState  {
}

class MeetingInitial extends MeetingState {}

class MeetingLoading extends MeetingState {}

class MeetingCreated extends MeetingState {
  final String meetingName;
  final String meetingId;

  MeetingCreated(this.meetingName, this.meetingId);

}

class MeetingJoined extends MeetingState {
  final String meetingName;
  final String meetingId;

  MeetingJoined(this.meetingName, this.meetingId);

 
}

class MeetingError extends MeetingState {
  final String error;

  MeetingError(this.error);
}