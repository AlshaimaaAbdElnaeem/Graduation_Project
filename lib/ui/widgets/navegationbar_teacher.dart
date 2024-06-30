import 'package:flutter/material.dart';
import 'package:graduation_project/ui/screens/assignment_page.dart';
import 'package:graduation_project/ui/screens/live_page.dart';
import 'package:graduation_project/ui/screens/profile_page.dart';
import 'package:graduation_project/ui/screens/settingPage.dart';
import 'package:graduation_project/ui/screens/teacher_page.dart';

class CustomNavigationBarTeacher extends StatefulWidget {
  const CustomNavigationBarTeacher({super.key});

  @override
  State<CustomNavigationBarTeacher> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBarTeacher> {
  int index = 2;
  final pages = [
    const SettingPage(),
     ProfilePage(),
    TeacherPage(),
   const AssignmentPage(),
   const LivePage(),   
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
            NavigationDestination(
                icon: Icon(Icons.person_2_rounded), label: 'Profiles'),
            NavigationDestination(icon: Icon(Icons.home), label: 'HomePage'),
            NavigationDestination(
                icon: Icon(Icons.assignment), label: 'Assignments'),
            NavigationDestination(
                icon: Icon(Icons.videocam_outlined), label: 'Live'),
          ]),
    );
  }
}
