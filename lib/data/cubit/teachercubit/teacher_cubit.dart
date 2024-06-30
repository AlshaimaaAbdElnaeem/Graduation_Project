import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/registercubit/registercubit.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacher_status.dart';
import 'package:graduation_project/ui/constant.dart';

class TeacherCubit extends Cubit<TeacherState> {

  TeacherCubit() : super(TeacherInitial());
  CollectionReference materials =
      FirebaseFirestore.instance.collection(kMaterialsCollection);

  Future<String> getMaterialID(String materialName , BuildContext context) async {
    emit(TeacherLoading());
    try {
      final registerData = context.read<RegisterCubit>();
      DocumentReference docRef = await materials.add({
        'MaterialName': materialName,
        'email': registerData.email,
        'teacherName' :registerData.name,
      });
      emit(TeacherLoaded(docRef.id));
      return docRef.id;
    } catch (e) { 
      emit(TeacherError("Failed to add material"));
      rethrow;
    }
  }
  Future <void>fechData ()async{
   try {
    
     
   } catch (e) {
     
   }
  }
}
