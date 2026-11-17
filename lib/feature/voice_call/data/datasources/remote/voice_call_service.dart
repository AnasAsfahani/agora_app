import 'dart:async';
import 'package:agora_app/core/app_keys.dart';
import 'package:agora_app/feature/voice_call/data/models/join_channel_request_model.dart';
import 'package:agora_app/feature/voice_call/data/datasources/local/voice_call_local_data_source.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceCallService {
  final VoiceCallLocalDataSource _voiceCallLocalDataSource;
  VoiceCallService(this._voiceCallLocalDataSource);

  late final RtcEngine _engine;

  Future<void> initializeAgoraVoiceSDK() async {
    _engine = createAgoraRtcEngine();

    await _engine.initialize(
      RtcEngineContext(
        appId: AppKeys.appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );

    await _engine.enableAudio();

    // Set the default output route BEFORE joining.
    await _engine.setDefaultAudioRouteToSpeakerphone(true);

    // Set remote playback volume to maximum for testing.
    await _engine.adjustPlaybackSignalVolume(100);
  }

  Future<void> requestPermissions() async {
    await [Permission.microphone].request();
  }

  Future<void> joinChannel({
    required JoinChannelRequestModel joinChannelRequestModel,
  }) async {
    await _engine.joinChannel(
      token: joinChannelRequestModel.token,
      channelId: joinChannelRequestModel.chanelId,
      options: const ChannelMediaOptions(
        autoSubscribeAudio: true,
        publishMicrophoneTrack: true,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
      uid: 0,
    );
  }

  void setupEventHandlers() {
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onAudioVolumeIndication:
            (
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

        onRemoteAudioStateChanged:
            (
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

        onLocalAudioStateChanged:
            (
            RtcConnection connection,
            LocalAudioStreamState state,
            LocalAudioStreamReason reason,
            ) {
          debugPrint('LOCAL AUDIO: state=$state, reason=$reason');
        },
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("Local user ${connection.localUid} joined");
        },
        onUserJoined:
            (RtcConnection connection, int remoteUid, int elapsed) async {
          debugPrint("Remote user $remoteUid joined");
          await _voiceCallLocalDataSource.setRemoteUid(remoteUid);
        },
        onUserOffline:
            (
            RtcConnection connection,
            int remoteUid,
            UserOfflineReasonType reason,
            ) async {
          debugPrint("Remote user \$remoteUid left");
          await _voiceCallLocalDataSource.clearToken();
        },
      ),
    );
  }

  Future<void> startVoiceCalling(
      JoinChannelRequestModel joinChannelRequestModel,
      ) async {
    await requestPermissions();
    await initializeAgoraVoiceSDK();
    setupEventHandlers();
    await joinChannel(joinChannelRequestModel: joinChannelRequestModel);
    await _engine.enableAudioVolumeIndication(
      interval: 500,
      smooth: 3,
      reportVad: true,
    );
  }

  Future<void> cleanupAgoraEngine() async {
    await _engine.leaveChannel();
    await _engine.release();
  }
}
