import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../router/constant_go_router.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {
              // قم بإضافة وظيفة تغيير كلمة المرور هنا
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Change Language'),
            onTap: () {
              // قم بإضافة وظيفة تغيير اللغة هنا
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Change Theme'),
            onTap: () {
              // قم بإضافة وظيفة تغيير السمة هنا
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
             context.go(viewPages);
            },
          ),
        ],
      ),
    );
  }
}
