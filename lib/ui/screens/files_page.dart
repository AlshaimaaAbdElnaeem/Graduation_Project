import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/assignmentcubit/assignment_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/cubit/assignmentcubit/assignment_cubit.dart';

class FilesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FileUploadCubit(),
      child: FileUploadView(),
    );
  }
}

class FileUploadView extends StatelessWidget {
  final TextEditingController _fileIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload'),
      ),
      body: BlocBuilder<FileUploadCubit, AssignmentState>(
        builder: (context, state) {
          if (state == PickedFile|| state == UploadingAssignment) {
            return Center(child: CircularProgressIndicator());
          } else if (state ==SuccessAssignment) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 100.0),
                  const  Text('File uploaded successfully'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FileUploadCubit>().emit(AssignmentInitial());
                    },
                    child:const Text('Upload file'),
                  ),
                ],
              ),
            );
          } else if (state == FailureAssignment) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 100.0),
                  const Text('Failed to upload file'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FileUploadCubit>().emit(AssignmentInitial());
                    },
                    child:const Text('Try Again'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<FileUploadCubit>().pickFile();
                    },
                    child: const Text('upload file'),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _fileIdController,
                    decoration: const InputDecoration(labelText: 'Enter File ID'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final fileId = _fileIdController.text;
                      final fileUrl = await context.read<FileUploadCubit>().getFileUrl(fileId);
                      if (fileUrl != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('File URL'),
                            content: Text(fileUrl),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('File not found')));
                      }
                    },
                    child: Text('Get File URL'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
