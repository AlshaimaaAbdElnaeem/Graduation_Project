import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/router/constant_go_router.dart';

class JoinMeetingPage extends StatefulWidget {
  const JoinMeetingPage({super.key});

  @override
  State<JoinMeetingPage> createState() => _LiveStreamPageState();
}

class _LiveStreamPageState extends State<JoinMeetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.push(meetingPage);
            },
            child: const Text('join Meeting'),
          ),
        ],
      ),
    );
  }
}
