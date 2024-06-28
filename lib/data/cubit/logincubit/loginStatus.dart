abstract class LogInState {}

class LogInInitial extends LogInState {}

class UserNotFound extends LogInState {}

class WrongPassword extends LogInState {}
class LoginSuccessfully extends LogInState{}
class AnotherError extends LogInState {
  final String errorMessage;

  AnotherError({required this.errorMessage});
}
