import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/assignmentcubit/assignment_state.dart';


// Cubit
class FileUploadCubit extends Cubit<AssignmentState> {
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  FileUploadCubit() : super(AssignmentInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> pickFile() async {
    emit(PickUpFile());
    try {
      var result = await FilePicker.platform.pickFiles();
      if (result != null) {
        emit(UploadingAssignment());
        File file = File(result.files.single.path.toString());
        await _uploadFile(file);
        emit(SuccessAssignment());
      } else {
        emit(AssignmentInitial()); // User canceled
      }
    } catch (e) {
      print('Error picking file: $e');
      emit(FailureAssignment());
    }
  }

  Future<void> _uploadFile(File file) async {
    try {
      final ref = _storage.ref().child('uploads/${file.path.split('/').last}');
      await ref.putFile(file);
      final downloadURL = await ref.getDownloadURL();
      await _firestore.collection('files').add({'id': file.path.split('/').last, 'url': downloadURL});
    } catch (e) {
      print('Error uploading file: $e');
      emit(FailureAssignment());
    }
  }
  Future<String> getFileUrl(String fileId) async {
    try {
      final doc = await _firestore.collection('files').where('id', isEqualTo: fileId).get();
      if (doc.docs.isNotEmpty) {
        return doc.docs.first['url'];
      } else {
        throw Exception('File not found');
      }
    } catch (e) {
      print('Error getting file URL: $e');
      return '';
    }
}
}
