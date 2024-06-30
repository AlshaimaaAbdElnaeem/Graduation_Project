import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacher_status.dart';
import 'package:graduation_project/data/cubit/teachercubit/teacher_cubit.dart';
import 'package:graduation_project/ui/constant.dart';
import 'package:graduation_project/ui/widgets/teacher_card.dart';

class TeacherPage extends StatelessWidget {
  TeacherPage({super.key});
  String? materialName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeacherCubit()..fetchData(context),
      child: BlocBuilder<TeacherCubit, TeacherState>(
        builder: (context, state) {
          print('Current State: $state'); // Log the state for debugging
          var teacherCubit = BlocProvider.of<TeacherCubit>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Enter the Material Name'),
                        content: TextField(
                          cursorColor: mainColor,
                          onSubmitted: (value) {
                            materialName = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              if (materialName != null &&
                                  materialName!.isNotEmpty) {
                                await teacherCubit.addMaterial(
                                    materialName!, context);
                                Navigator.of(context).pop();
                                await teacherCubit.fetchData(context);
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
                } else if (state is TeacherLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TeacherLoaded) {
                  return ListView.builder(
                    itemCount: state.materialData.length,
                    itemBuilder: (context, index) {
                      var material = state.materialData[index];
                      return TeacherCard(
                        materialName: material['materialName']!,
                        materialID: material['id']!,
                      );
                    },
                  );
                } else if (state is TeacherError) {
                  return Center(child: Text(state.message));
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
