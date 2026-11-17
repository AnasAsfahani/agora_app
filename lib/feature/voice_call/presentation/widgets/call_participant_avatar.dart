import 'package:flutter/material.dart';

class CallParticipantAvatar extends StatelessWidget {
  const CallParticipantAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF6677F5).withOpacity(0.35),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6677F5).withOpacity(0.13),
            blurRadius: 45,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF252D48),
        ),
        child: const Center(
          child: Icon(
            Icons.person_rounded,
            color: Color(0xFFADB9FF),
            size: 85,
          ),
        ),
      ),
    );
  }
}