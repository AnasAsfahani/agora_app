import 'package:flutter/material.dart';

class CallAudioVisualizer extends StatelessWidget {
  const CallAudioVisualizer({super.key});

  static const List<double> _heights = [
    12, 22, 35, 18, 28, 42, 24,
    15, 34, 45, 25, 17, 30, 12,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _heights.map((height) {
        return Container(
          width: 4,
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: const Color(0xFF7185FF),
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }).toList(),
    );
  }
}