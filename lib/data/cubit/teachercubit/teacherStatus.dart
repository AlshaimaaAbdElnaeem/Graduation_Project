abstract class TeacherState {}

class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class TeacherLoaded extends TeacherState {
  final String materialID;

  TeacherLoaded(this.materialID);
}

class TeacherError extends TeacherState {
  final String message;

  TeacherError(this.message);
}
