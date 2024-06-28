import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/logincubit/loginStatus.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessfully());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(UserNotFound());
      } else if (e.code == 'wrong-password') {
        emit(WrongPassword());
      }
    } catch (e) {
      emit(AnotherError(errorMessage: e.toString()));
    }
  }
}
