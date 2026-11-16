import 'dart:async';
import 'package:agora_app/core/model/join_channel_request_model.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/join_channel_request_model.dart';

class AgoraService{

  late final RtcEngine _engine ;




  // Set up the Agora RTC engine instance
  Future<void> _initializeAgoraVoiceSDK() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: "",
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));
  }


  // Join a channel
  Future<void> _joinChannel(JoinChannelRequestModel joinChannelRequestModel) async {
    await _engine.joinChannel(
      token: joinChannelRequestModel.token,
      channelId: joinChannelRequestModel.chanelId,
      options: const ChannelMediaOptions(
        autoSubscribeAudio: true, // Automatically subscribe to all audio streams
        publishMicrophoneTrack: true, // Publish microphone-captured audio
        // Use clientRoleBroadcaster to act as a host or clientRoleAudience for audience
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
      uid: 0,
    );



  }

  // Register an event handler for Agora RTC
  void _setupEventHandlers() {
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("Local user ${connection.localUid} joined");
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("Remote user $remoteUid joined");

         //   _remoteUid = remoteUid; // Store remote user ID

        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          debugPrint("Remote user $remoteUid left");
          // setState(() {
          //   _remoteUid = null; // Remove remote user ID
          // });
        },
      ),
    );
  }

  // Requests microphone permission
  Future<void> _requestPermissions() async {
    await [Permission.microphone].request();
  }


  Future<void>  makeVoiceCall ()async{
    await _requestPermissions();
    await _initializeAgoraVoiceSDK();
    _setupEventHandlers();
    await _joinChannel(JoinChannelRequestModel(token: "", chanelId: ""));


  }





  Future<void> _setupLocalVideo() async {
    // The video module and preview are disabled by default.
    await _engine.enableVideo();
    await _engine.startPreview();
  }


















}