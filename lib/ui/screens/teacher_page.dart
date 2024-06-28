import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacherStatus.dart';
import 'package:graduation_project/data/cubit/teachercubit/teachercubit.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/teacher_card.dart';

class TeacherPage extends StatelessWidget {
  TeacherPage({super.key});
  String? materialName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherCubit, TeacherState>(builder: (context, state) {
      var teacherData = BlocProvider.of<TeacherCubit>(context);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SizedBox(
                    child: AlertDialog(
                      title: const Text('Enter the Material Name'),
                      content: TextField(
                        cursorColor: mainColor,
                        onSubmitted: (value) {
                          materialName = value;
                        },
                      ),
                      actions: [
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            if (materialName != null && materialName!.isNotEmpty) {
                              await teacherData.getMaterialID(materialName!);
                              Navigator.of(context).pop(); // إغلاق الـ Dialog بعد الإضافة
                            }
                          },
                          child: const Center(
                            child: Text(
                              'ok',
                              style: TextStyle(fontSize: 30, color: mainColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_circle_outline,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Builder(
          builder: (context) {
            if (state is TeacherInitial) {
              return const Center(child: Text('Enter your Material Name'));
            } else if (state is TeacherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TeacherLoaded) {
              return TecaherCard(
                materialName: materialName!,
                materialID: state.materialID,
              );
            } else if (state is TeacherError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown State'));
            }
          },
        ),
      );
    });
  }
}
