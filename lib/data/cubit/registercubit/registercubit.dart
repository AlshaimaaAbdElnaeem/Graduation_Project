import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/registercubit/registerstatus.dart';
import 'package:graduation_project/ui/constant.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  String? selectPerson;
  person(selectPerson) {
    if (selectPerson == 'Teacher') {
      emit(PersonIsTeacher());
    } else {
      emit(PersonIsStudent());
    }
  }

  Future<void> authentication(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterationSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(WeakPassword());
      } else if (e.code == 'email-already-in-use') {
        emit(EmailExist());
      }
    } catch (e) {
      emit(AnotherError(errorMessage: e.toString()));
    }
  }

  Future<void> storagePersonData(
      String name, String phone, String email) async {
    FirebaseFirestore.instance.collection(users).add({
      'id': email,
      'name': name,
      'phone': phone,
      'type': selectPerson,
    });
  }
}
