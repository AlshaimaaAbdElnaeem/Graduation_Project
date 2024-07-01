import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/meeting_cubit/meeting_cubit.dart';
import 'package:graduation_project/data/cubit/meeting_cubit/meeting_status.dart';
import 'package:graduation_project/ui/screens/meeting_page.dart';

class JoinMeetingPage extends StatelessWidget {
  final TextEditingController _meetingIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Join Meeting')),
        body: BlocListener<MeetingCubit, MeetingState>(
          listener: (context, state) {
            if (state is MeetingJoined) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeetingPage(
                    meetingName: state.meetingName,
                    meetingId: state.meetingId,
                  ),
                ),
              );
            } else if (state is MeetingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _meetingIdController,
                  decoration: const InputDecoration(labelText: 'Meeting ID'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MeetingCubit>()
                        .joinMeeting(_meetingIdController.text);
                  },
                  child: const Text('Join Meeting'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
