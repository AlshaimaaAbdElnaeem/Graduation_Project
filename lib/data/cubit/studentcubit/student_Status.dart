abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Map<String, String>> data;

  StudentLoaded(this.data);
}

class StudentError extends StudentState {
  final String error;

  StudentError(this.error);
}
class MaterialDataLoading extends StudentState {}

class MaterialDataLoaded extends StudentState {
}

class MaterialDataError extends StudentState {
  final String error;

  MaterialDataError(this.error);
}