import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/student_meeting_cubit/student_meeting_cubit.dart';
import 'package:graduation_project/data/cubit/student_meeting_cubit/student_meeting_status.dart';

class StudentScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final studentCubit = context.read<StudentMeetingCubit>();
String ? channelName ;
    return BlocBuilder<StudentMeetingCubit, StudentMeetingState>(
      builder: (context, state) {
        if (state is StudentMeetingInitial) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  'Enter Channel Name',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                TextField(
                  onChanged: (value) {
                    channelName = value!.toString() ;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    studentCubit.joinChannel(channelName!);
                  },
                  child:const Text('Join Broadcast'),
                ),
              ],
            ),
          );
        } else if (state is StudentMeetingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StudentChannelJoined) {
          return const Center(child: Text('Joined channel successfully!'));
        } else if (state is StudentRemoteJoined) {
          return const Center(child: Text('Teacher joined the channel!'));
        } else if (state is StudentRemoteLeft) {
          return const Center(child: Text('Teacher left the channel!'));
        } else if (state is StudentLeftChannel) {
          return const Center(child: Text('Left channel!'));
        } else if  (state is StudentMeetingError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown State'));
        }
      },
    );
  }
}
