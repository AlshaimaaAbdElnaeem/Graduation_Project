import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/logincubit/logincubit.dart';
import 'package:graduation_project/data/cubit/registercubit/registercubit.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacher_status.dart';
import 'package:graduation_project/ui/constant.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());
  CollectionReference materials =
      FirebaseFirestore.instance.collection(kMaterialsCollection);

  Future<void> addMaterial(String materialName, BuildContext context) async {
    emit(TeacherLoading());
    try {
      final registerData = context.read<RegisterCubit>();
      await materials.add({
        'MaterialName': materialName,
        'email': registerData.email,
        'teacherName': registerData.name,
      });
      await fetchData(context); // Update the data after adding a new material
    } catch (e) {
      emit(TeacherError("Failed to add material"));
      rethrow;
    }
  }

  Future<void> fetchData(BuildContext context) async {
    final registerData = context.read<RegisterCubit>();
    final loginData = context.read<LogInCubit>();
    try {
      emit(TeacherLoading());
      QuerySnapshot snapshot = await materials.get();
      List<DocumentSnapshot> documents = snapshot.docs;
      print(registerData.email.toString());
      List<Map<String, String>> materialData = documents
          .where((doc) =>
              doc['email'] == registerData.email ||
              doc['email'] == loginData.email)
          .map((doc) {
        return {
          'materialName': doc['MaterialName'].toString(),
          'id': doc.id.toString(),
        };
      }).toList();
      emit(TeacherLoaded(materialData));
    } catch (e) {
      emit(TeacherInitial());
    }
  }
}
