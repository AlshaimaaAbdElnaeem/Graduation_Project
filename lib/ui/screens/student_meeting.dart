import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/student_meeting_cubit/student_meeting_cubit.dart';
import 'package:graduation_project/data/cubit/student_meeting_cubit/student_meeting_status.dart';

class StudentScreen extends StatelessWidget {
  final String channelName;

  StudentScreen({required this.channelName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentMeetingCubit(),
      child: BlocBuilder<StudentMeetingCubit, StudentMeetingState>(
        builder: (context, state) {
          final studentCubit = context.read<StudentMeetingCubit>();

          if (state is StudentMeetingInitial) {
            studentCubit.joinChannel(channelName);
          }

          return Scaffold(
            appBar: AppBar(
              title:const Text('Student Screen'),
            ),
            body: Center(
              child: _buildContent(state, studentCubit),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(StudentMeetingState state, StudentMeetingCubit cubit) {
    if (state is StudentMeetingLoading) {
      return const CircularProgressIndicator();
    } else if (state is StudentChannelJoined) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Joined channel: $channelName'),
          ElevatedButton(
            onPressed: () => cubit.leaveChannel(),
            child:const Text('Leave Channel'),
          ),
        ],
      );
    } else if (state is StudentRemoteJoined) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Remote user joined: ${state.remoteUid}'),
          ElevatedButton(
            onPressed: () => cubit.leaveChannel(),
            child:const Text('Leave Channel'),
          ),
        ],
      );
    } else if (state is StudentRemoteLeft) {
      return const Text('Remote user left');
    } else if (state is StudentLeftChannel) {
      return const Text('Left the channel');
    } else if  (state is StudentMeetingError) {
      return Text(state.message);
    } else {
      return const Text('Unknown state');
    }
  }
}
