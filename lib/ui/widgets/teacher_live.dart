import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/router/constant_go_router.dart';

class CreateMeetingPage extends StatefulWidget {
  const CreateMeetingPage({super.key});

  @override
  State<CreateMeetingPage> createState() => _LiveStreamPageState();
}

class _LiveStreamPageState extends State<CreateMeetingPage> {
  @override                
           
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
             context.push(meetingPage);
          }, child:const Text('Start Meeting'),),
          
        ],
      ),
    );
  }
}