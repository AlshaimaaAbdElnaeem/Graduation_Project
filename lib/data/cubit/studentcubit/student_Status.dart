abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentDataLoading extends StudentState {}

class StudentDataLoaded extends StudentState {
  final List<Map<String, dynamic>> data;

  StudentDataLoaded(this.data);
}

class StudentDataError extends StudentState {
  final String error;

  StudentDataError(this.error);
}
class MaterialDataLoading extends StudentState {}

class MaterialDataLoaded extends StudentState {
  final List<Map<String, dynamic>> data;

  MaterialDataLoaded(this.data);
}

class MaterialDataError extends StudentState {
  final String error;

  MaterialDataError(this.error);
}