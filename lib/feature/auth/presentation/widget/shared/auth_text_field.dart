import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.controller, required this.label, required this.hint,
    required this.prefixIcon, this.validator, this.keyboardType,
    this.textInputAction, this.obscureText = false, this.suffix,
    this.autofillHints, this.textCapitalization = TextCapitalization.none,
    super.key,
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffix;
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller, validator: validator, keyboardType: keyboardType,
      textInputAction: textInputAction, obscureText: obscureText,
      autofillHints: autofillHints, textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label, hintText: hint, prefixIcon: Icon(prefixIcon),
        suffixIcon: suffix, filled: true,
        fillColor: colors.surfaceContainerHighest.withValues(alpha: .35),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colors.primary, width: 1.6),
        ),
        errorMaxLines: 2,
      ),
    );
  }
}
