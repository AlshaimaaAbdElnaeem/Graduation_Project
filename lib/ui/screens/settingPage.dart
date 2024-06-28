import 'package:flutter/material.dart';
import 'package:graduation_project/ui/constant.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Text(
              'Language',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
