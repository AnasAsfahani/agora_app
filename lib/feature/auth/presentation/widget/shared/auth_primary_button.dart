import 'package:flutter/material.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    required this.label, required this.onPressed, this.isLoading = false, super.key,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity, height: 56,
    child: FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      )),
      child: isLoading
        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(
            strokeWidth: 2.2, color: Colors.white,
          ))
        : Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
    ),
  );
}
