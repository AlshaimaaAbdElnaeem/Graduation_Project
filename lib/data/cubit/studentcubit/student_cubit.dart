import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/logincubit/logincubit.dart';
import 'package:graduation_project/data/cubit/registercubit/registercubit.dart';
import 'package:graduation_project/data/cubit/studentcubit/student_status.dart';
import 'package:graduation_project/ui/constant.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference materials = FirebaseFirestore.instance.collection(kStudentMaterial);

  Future<void> addMaterial(String materialID, BuildContext context) async {
    emit(StudentLoading());
    try {
      final registerData = context.read<RegisterCubit>();
      // Fetch the material name
      String materialName = await fetchMaterialName(materialID);

      await materials.add({
        'material_id': materialID,
        'student_id': registerData.email,
        'teacherName': registerData.name,
        'material_name': materialName,
      });

      await fetchData(context);
    } catch (e) {
      emit(StudentError("Failed to add material"));
      rethrow;
    }
  }

  Future<String> fetchMaterialName(String materialID) async {
    try {
      emit(MaterialDataLoading());
      DocumentSnapshot documentSnapshot = await _firestore.collection(kMaterialsCollection).doc(materialID).get();
      if (documentSnapshot.exists) {
        Map<String, String> data = documentSnapshot.data() as Map<String, String>;
        return data['name']!;
      } else {
        throw Exception("Material not found");
      }
    } catch (e) {
      emit(MaterialDataError(e.toString()));
      rethrow;
    }
  }

  // Future<void> fetchUserData() async {
  //   try {
  //     emit(StudentDataLoading());
  //     QuerySnapshot snapshot = await _firestore.collection(users).get();
  //     await _firestore.collection(kMaterialsCollection).get();
  //     List<DocumentSnapshot> documents = snapshot.docs;
  //     List<Map<String, String>> userData =
  //         documents.map((doc) => doc.data() as Map<String, String>).toList();
  //     emit(StudentDataLoaded(userData));
  //   } catch (e) {
  //     emit(StudentDataError(e.toString()));
  //   }
  // }

  Future<void> fetchData(BuildContext context) async {
    final registerData = context.read<RegisterCubit>();
    final loginData = context.read<LogInCubit>();
    try {
      emit(StudentLoading());
      QuerySnapshot snapshot = await materials.get();
      List<DocumentSnapshot> documents = snapshot.docs;
      print(registerData.email.toString());
      List<Map<String, String>> materialData = documents
          .where((doc) =>
              doc['email'] == registerData.email ||
              doc['email'] == loginData.email )
          .map((doc) {
        return {
          'materialName': doc['material_name'].toString(),
          'teacherName' :doc['teacher_name'].toString()
        };
      }).toList();
      emit(StudentLoaded(materialData));
    } catch (e) {
      emit(StudentInitial());
    }
  }
}

