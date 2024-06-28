abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class PersonIsTeacher extends RegisterState {}

class PersonIsStudent extends RegisterState {}

class WeakPassword extends RegisterState {}

class EmailExist extends RegisterState {}
class RegisterationSuccess extends RegisterState {}
class AnotherError extends RegisterState {
 final String errorMessage;

  AnotherError({required this.errorMessage});
}
