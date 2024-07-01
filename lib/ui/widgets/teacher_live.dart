import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/data/cubit/meeting_cubit/meeting_cubit.dart';
import 'package:graduation_project/data/cubit/meeting_cubit/meeting_status.dart';
import 'package:graduation_project/helper/show_snack_bar.dart';
import 'package:graduation_project/ui/screens/meeting_page.dart';

class CreateMeetingPage extends StatelessWidget {
  final TextEditingController _meetingNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MeetingCubit(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Create Meeting')),
          body: BlocListener<MeetingCubit, MeetingState>(
            listener: (context, state) {
              if (state is MeetingCreated) {
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
                showSnackBar(context, state.error.toString());
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _meetingNameController,
                    decoration:
                        const InputDecoration(labelText: 'Meeting Name'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<MeetingCubit>()
                          .createMeeting(_meetingNameController.text);
                    },
                    child: const Text('Create Meeting'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
