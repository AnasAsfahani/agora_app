import 'package:flutter/material.dart';

class CallConnectionStatus extends StatelessWidget {
  final String status;

  const CallConnectionStatus({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: Color(0xFF55D6A0),
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 9),

        Text(
          status,
          style: const TextStyle(
            color: Color(0xFF929AAF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}