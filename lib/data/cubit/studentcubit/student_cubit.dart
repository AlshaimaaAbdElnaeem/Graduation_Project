import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/studentcubit/student_status.dart';
import 'package:graduation_project/ui/constant.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> fetchUserData() async {
    try {
      emit(StudentDataLoading());
      QuerySnapshot snapshot = await _firestore.collection(users).get();
      await _firestore.collection(kMaterialsCollection).get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<Map<String, String>> userData =
          documents.map((doc) => doc.data() as Map<String, String>).toList();
      emit(StudentDataLoaded(userData));
    } catch (e) {
      emit(StudentDataError(e.toString()));
    }
  }

  Future<void> fetchMaterialData() async {
    try {
      emit(MaterialDataLoading());
      QuerySnapshot snapshot =
          await _firestore.collection(kMaterialsCollection).get();
      List<DocumentSnapshot> documents = snapshot.docs;
      List<Map<String, String>> materialData =
          documents.map((doc) => doc.data() as Map<String, String>).toList();
      emit(MaterialDataLoaded(materialData));
    } catch (e) {
      emit(MaterialDataError(e.toString()));
    }
  }
}
