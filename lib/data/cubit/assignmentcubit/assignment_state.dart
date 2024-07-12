import 'dart:io';

class AssignmentState{}
class AssignmentInitial extends AssignmentState{}
class PickUpFile extends AssignmentState{}
class UploadingAssignment extends AssignmentState{}
class SuccessAssignment extends AssignmentState{}
class FailureAssignment extends AssignmentState{}
abstract class FileUploadEvent {
  final File file;

  FileUploadEvent(this.file);
}