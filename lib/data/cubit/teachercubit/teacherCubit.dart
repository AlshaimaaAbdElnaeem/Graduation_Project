import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacherStatus.dart';
import 'package:graduation_project/ui/constant.dart';


class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());

  CollectionReference materials = FirebaseFirestore.instance.collection(kMaterialsCollection);

  Future<String> getMaterialID(String materialName) async {
    emit(TeacherLoading());  // Emit loading state
    try {
      DocumentReference docRef = await materials.add({
        'MaterialName': materialName,
      });
      emit(TeacherLoaded(docRef.id));  // Emit loaded state with material ID
      return docRef.id;
    } catch (e) {
      emit(TeacherError("Failed to add material"));  // Emit error state
      rethrow;
    }
  }
}
