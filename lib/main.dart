import 'dart:async';
import 'package:agora_app/core/app_keys.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MyApp());

// Fill in the app ID obtained from Agora console
final appId = AppKeys.appId;
// Fill in the temporary token generated from Agora Console
final token = AppKeys.temporaryToken ;
final channel = AppKeys.channelName;

// Main App Widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _MainScreen(),
    );
  }
}

// Voice call Screen Widget
class _MainScreen extends StatefulWidget {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenScreenState createState() => _MainScreenScreenState();
}

class _MainScreenScreenState extends State<_MainScreen> {
  late RtcEngine _engine; // Stores Agora RTC Engine instance
  int? _remoteUid; // Stores the remote user's UID

  @override
  void initState() {
    super.initState();
    _startVoiceCalling();
  }

  // Initializes Agora SDK
  Future<void> _startVoiceCalling() async {
    await _requestPermissions();
    await _initializeAgoraVoiceSDK();
    _setupEventHandlers();
    await _joinChannel();
    await _engine.enableAudioVolumeIndication(
      interval: 500,
      smooth: 3,
      reportVad: true,
    );
  }

  // Requests microphone permission
  Future<void> _requestPermissions() async {
    await [Permission.microphone].request();
  }

  // Set up the Agora RTC engine instance
  Future<void> _initializeAgoraVoiceSDK() async {
    _engine = createAgoraRtcEngine();

    await _engine.initialize(
      RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    await _engine.enableAudio();

    // Set the default output route BEFORE joining.
    await _engine.setDefaultAudioRouteToSpeakerphone(true);

    // Set remote playback volume to maximum for testing.
    await _engine.adjustPlaybackSignalVolume(100);
  }
  // Register an event handler for Agora RTC
  void _setupEventHandlers() {
    _engine.registerEventHandler(

      RtcEngineEventHandler(

        onAudioVolumeIndication: (
            RtcConnection connection,
            List<AudioVolumeInfo> speakers,
            int speakerNumber,
            int totalVolume,
            ) {
          for (final speaker in speakers) {
            debugPrint(
              'AUDIO VOLUME: uid=${speaker.uid}, volume=${speaker.volume}',
            );
          }
        },

        onRemoteAudioStateChanged: (
            RtcConnection connection,
            int remoteUid,
            RemoteAudioState state,
            RemoteAudioStateReason reason,
            int elapsed,
            ) {
          debugPrint(
            'REMOTE AUDIO: uid=$remoteUid, state=$state, reason=$reason',
          );
        },

        onLocalAudioStateChanged: (
            RtcConnection connection,
            LocalAudioStreamState state,
            LocalAudioStreamReason reason,
            ) {
          debugPrint(
            'LOCAL AUDIO: state=$state, reason=$reason',
          );
        },
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("Local user ${connection.localUid} joined");
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("Remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid; // Store remote user ID
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          debugPrint("Remote user \$remoteUid left");
          setState(() {
            _remoteUid = null; // Remove remote user ID
          });
        },
      ),
    );
  }

  // Join a channel
  Future<void> _joinChannel() async {
    await _engine.joinChannel(
      token: token,
      channelId: channel,
      options: const ChannelMediaOptions(
        autoSubscribeAudio: true,
        publishMicrophoneTrack: true,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
      uid: 0,
    );

  }

  @override
  void dispose() {
    _cleanupAgoraEngine();
    super.dispose();
  }

  // Leaves the channel and releases resources
  Future<void> _cleanupAgoraEngine() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agora Voice Call',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora Voice Call'),
        ),
        body: Center(
          child: Text(
            _remoteUid != null
                ? "Remote user $_remoteUid joined"
                : "No remote user in the channel", // Show appropriate message
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}