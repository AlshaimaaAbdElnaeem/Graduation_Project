import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveSteam extends StatefulWidget {
  const LiveSteam({super.key,});
  // final String userID;
  // final String userName;
  // final String liveId;
  @override
  State<LiveSteam> createState() => _LiveSteamState();
}

class _LiveSteamState extends State<LiveSteam> {
  @override
  Widget build(BuildContext context) {
    
    return ZegoUIKitPrebuiltLiveStreaming(
        appID: 955365448,
        appSign:
            '0ea89aa2cbf4ad3e23534fb83964d462097f4e05aa006c05fae26ca862c537bc',
        userID: "shimoo",
        userName: "shimoo",
        liveID: "shimoo",
        config:'1111111'==""?ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),);
  }
}
