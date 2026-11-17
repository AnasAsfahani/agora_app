import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({required this.title, required this.subtitle, super.key});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(Icons.graphic_eq_rounded, size: 30, color: colors.onPrimaryContainer),
        ),
        const SizedBox(height: 28),
        Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w800, letterSpacing: -0.7,
        )),
        const SizedBox(height: 8),
        Text(subtitle, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: colors.onSurfaceVariant, height: 1.5,
        )),
      ],
    );
  }
}
