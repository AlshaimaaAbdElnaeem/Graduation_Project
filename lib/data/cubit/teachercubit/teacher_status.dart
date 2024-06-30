abstract class TeacherState {}

class TeacherInitial extends TeacherState {}

class TeacherLoading extends TeacherState {}

class TeacherLoaded extends TeacherState {
  final List<Map<String, String>> materialData;

  TeacherLoaded(this.materialData);
}

class TeacherError extends TeacherState {
  final String message;

  TeacherError(this.message);
}


