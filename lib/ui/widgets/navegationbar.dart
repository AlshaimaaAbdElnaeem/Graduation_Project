import 'package:flutter/material.dart';
import 'package:graduation_project/ui/screens/settingPage.dart';
import 'package:graduation_project/ui/screens/student_meeting.dart';
import 'package:graduation_project/ui/screens/student_page.dart';

import '../screens/assignment_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int index = 1;
  final pages = [
     SettingsPage(),
    StudentPage(),
    AssignmentPage(),
   JoinMeetingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.settings), label: 'Setting'),
            NavigationDestination(icon: Icon(Icons.home), label: 'HomePage'),
            NavigationDestination(
                icon: Icon(Icons.assignment), label: 'Assignments'),
            NavigationDestination(
                icon: Icon(Icons.videocam_outlined), label: 'Live'),
          ]),
    );
  }
}
