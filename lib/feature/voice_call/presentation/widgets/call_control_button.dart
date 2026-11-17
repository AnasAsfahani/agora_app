import 'package:flutter/material.dart';

class CallControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isActive;
  final bool isDestructive;

  const CallControlButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDestructive
        ? const Color(0xFFE94B62)
        : isActive
        ? const Color(0xFF34416D)
        : const Color(0xFF222839);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: backgroundColor,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: SizedBox(
              width: 62,
              height: 62,
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF929AAF),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}