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
  CollectionReference materials =
      FirebaseFirestore.instance.collection(kStudentMaterial);

  Future<void> addMaterial(String materialID, BuildContext context) async {
    emit(StudentLoading());
    try {
      final registerData = context.read<RegisterCubit>();
      Map<String, dynamic> materialData = await fetchMaterialName(materialID);

      await materials.add({
        'material_id': materialID,
        'student_id': registerData.email,
        'teacher_name': materialData['teacherName'],
        'material_name': materialData['MaterialName'],
      });

      await fetchData(context); // Update data after adding material
    } catch (e) {
      emit(StudentError("Failed to add material"));
    }
  }

  Future<Map<String, dynamic>> fetchMaterialName(String materialID) async {
    try {
      emit(MaterialDataLoading());
      DocumentSnapshot documentSnapshot = await _firestore
          .collection(kMaterialsCollection)
          .doc(materialID)
          .get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
            print (data['MaterialName'].toString());
        return data;
      } else {
        throw Exception("Material not found");
      }
    } catch (e) {
      emit(MaterialDataError(e.toString()));
      rethrow;
    }
  }

  Future<void> fetchData(BuildContext context) async {
    final registerData = context.read<RegisterCubit>();
    final loginData = context.read<LogInCubit>();
    try {
      emit(StudentLoading());
      QuerySnapshot snapshot = await materials.get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<Map<String, String>> materialData = documents
          .where((doc) =>
              doc['student_id'] == registerData.email ||
              doc['student_id'] == loginData.email)
          .map((doc) {
        return {
          'materialName': doc['material_name'].toString(),
          'teacherName': doc['teacher_name'].toString()
        };
      }).toList();
      if (materialData.isEmpty) {
        emit(StudentInitial());
      }
      emit(StudentLoaded(materialData)); // Update state with loaded data
    } catch (e) {
       emit(StudentInitial());
    }
  }
}
