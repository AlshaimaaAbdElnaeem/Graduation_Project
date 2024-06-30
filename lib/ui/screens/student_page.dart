import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/studentcubit/student_cubit.dart';
import 'package:graduation_project/data/cubit/studentcubit/student_status.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacher_status.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/subject_card.dart';

class StudentPage extends StatelessWidget {
  StudentPage({super.key});
  String? materialCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit()..fetchData(context),
      child: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          print('Current State: $state'); // Log the state for debugging
          var studentCubit = BlocProvider.of<StudentCubit>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Enter the Material code'),
                        content: TextField(
                          cursorColor: mainColor,
                          onSubmitted: (value) {
                            materialCode = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if (studentCubit != null &&
                                  materialCode!.isNotEmpty) {
                                await studentCubit.addMaterial(
                                    materialCode!, context);
                                Navigator.of(context).pop();
                                await studentCubit.fetchData(context);
                              }
                            },
                            child: const Center(
                              child: Text(
                                'OK',
                                style: TextStyle(fontSize: 20, color: mainColor),
                              ),
                            ),
                          ),
                        ],
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
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter your material code',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/main.jpg'),
                          radius: 100,
                        ),
                      )
                    ],
                  );
                } else if (state is StudentLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is StudentLoaded) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      var material = state.data[index];
                      return SubjectCard(
                        materialName: material['materialName']!,
                        teacherName: material['teacherName']!,
                      );
                    },
                  );
                } else if (state is StudentError) {
                  return Center(child: Text(state.error));
                } else {
                  return const Center(child: Text('Unknown State'));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
