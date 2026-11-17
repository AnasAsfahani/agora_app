import 'package:flutter/material.dart';

import '../widgets/voice_call_screen_body.dart';

class VoiceCallScreen extends StatelessWidget {
  const VoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF10131C),
      body: SafeArea(
        child: VoiceCallScreenBody(),
      ),
    );
  }
}