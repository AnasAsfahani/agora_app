import 'package:agora_app/core/routes/app_router.dart';
import 'package:agora_app/core/routes/routes.dart';
import 'package:agora_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/voice_call_cubit.dart';
import '../cubit/voice_call_state.dart';
import 'call_participant_avatar.dart';
import 'call_connection_status.dart';
import 'call_audio_visualizer.dart';
import 'call_controls_panel.dart';

class VoiceCallScreenBody extends StatelessWidget {
  const VoiceCallScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceCallCubit, VoiceCallState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              _buildHeader(),

              TextButton(child: Text("logout"),onPressed: (){
                context.read<AuthCubit>().logout() ;

              },) ,

              const Spacer(flex: 2),

              const CallParticipantAvatar(),

              const SizedBox(height: 32),

              const Text(
                'Voice Call',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 12),

              CallConnectionStatus(
                status: _getStatus(state),
              ),

              const SizedBox(height: 30),

              const CallAudioVisualizer(),

              const Spacer(flex: 2),

              const CallControlsPanel(),

              const SizedBox(height: 32),

              const Text(
                'End the call whenever you are ready',
                style: TextStyle(
                  color: Color(0xFF777E90),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _headerButton(Icons.arrow_back_rounded),

        const Text(
          'VOICE SESSION',
          style: TextStyle(
            color: Color(0xFF8F97AA),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),

        _headerButton(Icons.more_horiz_rounded),
      ],
    );
  }

  Widget _headerButton(IconData icon) {
    return GestureDetector(
      onTap: ()=> AppRouter.router.push(Routes.login),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF1B2030),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.white.withOpacity(0.06),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
      ),
    );
  }

  String _getStatus(VoiceCallState state) {
    return state.maybeWhen(
      initial: () => 'Ready to connect',
      loading: () => 'Connecting...',
      success: (_) => 'Call started',
      error: (error) => 'Connection failed',
      orElse: () => 'Waiting for connection',
    );
  }
}