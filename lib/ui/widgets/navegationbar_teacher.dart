import 'package:flutter/material.dart';
import 'package:graduation_project/ui/screens/assignment_page.dart';
import 'package:graduation_project/ui/screens/settingPage.dart';
import 'package:graduation_project/ui/screens/teacher_page.dart';
import 'package:graduation_project/ui/widgets/teacher_live.dart';

class CustomNavigationBarTeacher extends StatefulWidget {
  const CustomNavigationBarTeacher({Key? key});

  @override
  State<CustomNavigationBarTeacher> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBarTeacher> {
  int index = 1;
  final List<Widget> pages = [
    SettingsPage(),
     TeacherPage(),
     AssignmentPage(),
    CreateMeetingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: index,
          children: pages,
        ),
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
          ],
        ),
       );
  }
}
