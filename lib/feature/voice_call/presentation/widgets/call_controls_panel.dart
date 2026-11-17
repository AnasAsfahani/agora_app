import 'package:flutter/material.dart';

import 'call_control_button.dart';

class CallControlsPanel extends StatelessWidget {
  const CallControlsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF191E2C),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CallControlButton(
            icon: Icons.mic_off_rounded,
            label: 'Mute',
            onPressed: null,
          ),

          CallControlButton(
            icon: Icons.volume_up_rounded,
            label: 'Speaker',
            onPressed: null,
          ),

          CallControlButton(
            icon: Icons.bluetooth_rounded,
            label: 'Bluetooth',
            onPressed: null,
          ),

          CallControlButton(
            icon: Icons.call_end_rounded,
            label: 'End call',
            isDestructive: true,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}