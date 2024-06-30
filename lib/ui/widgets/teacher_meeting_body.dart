import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/data/cubit/teacher_meeting_cubit/teacher_meeting_cubit.dart';
import 'package:graduation_project/data/cubit/teacher_meeting_cubit/teacher_meeting_status.dart';
import 'package:graduation_project/router/constant_go_router.dart';

class TeacherScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final teacherCubit = context.read<TeacherMeetingCubit>();

    return BlocBuilder<TeacherMeetingCubit, TeacherMeetingState>(
      builder: (context, state) {
        if (state is TeacherMeetingInitial) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter your material code',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/main.jpg'),
                  radius: 100,
                ),
              ],
            ),
          );
        } else if (state is TeacherMeetingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TeacherChannelCreated) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Channel created successfully!',
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push(teacherLive);
                  },
                  child: const Text('Start Broadcasting'),
                ),
              ],
            ),
          );
        } else if (state is TeacherMeetingError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown State'));
        }
      },
    );
  }
}
