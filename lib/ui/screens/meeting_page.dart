import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class MeetingPage extends StatefulWidget {
  final String meetingName;
  final String meetingId;

  const MeetingPage({
    Key? key,
    required this.meetingName,
    required this.meetingId,
  }) : super(key: key);

  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    _initializeAgora();
  }

  void _initializeAgora() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: 'ed56be5e82ae4b7aae48a7fcf699f3e7'));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int uid) {
          print('joinChannelSuccess ${connection.channelId} $uid ');
        },
        onUserJoined: (RtcConnection connection, int uid, int elapsed) {
          print('userJoined $uid $elapsed');
        },
        onUserOffline:
            (RtcConnection connection, int uid, UserOfflineReasonType reason) {
          print('userOffline $uid $reason');
        },
      ),
    );

    await _engine.joinChannel(
      token: '',
      channelId: widget.meetingId,
      uid: 0,
      options:const ChannelMediaOptions(
        publishCustomAudioTrack: true,
        publishCameraTrack: true,
      ),
    );
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    _engine.destroyCustomEncodedVideoTrack(0);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meetingName),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Meeting ID: ${widget.meetingId}'),
            Expanded(
              child: AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(uid: 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
