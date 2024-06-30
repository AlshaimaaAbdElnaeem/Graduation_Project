import 'package:flutter/material.dart';

class TeacherLiveScreen extends StatelessWidget {
   String ? channelName;

   TeacherLiveScreen({Key? key, this.channelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Broadcast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Channel Name: $channelName',
              style: TextStyle(fontSize: 24),
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Start live broadcast logic
              },
              child: const Text('Start Broadcasting'),
            ),
          ],
        ),
      ),
    );
  }
}
