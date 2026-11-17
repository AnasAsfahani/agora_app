import 'package:flutter/material.dart';
import '../shared/auth_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.formKey, required this.nameController,
    required this.emailController, required this.passwordController,
    required this.confirmPasswordController, super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _hidePassword = true;
  bool _hideConfirmation = true;

  String? _nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.trim().length < 2) return 'Name is too short';
    return null;
  }

  String? _emailValidator(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'Email is required';
    final pattern = RegExp(r'^[A-Za-z0-9.!#$%&''*+/=?^_`{|}~-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)+');
    if (!pattern.hasMatch(input)) return 'Enter a valid email address';
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Use at least 6 characters';
    return null;
  }

  String? _confirmationValidator(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != widget.passwordController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) => Form(
    key: widget.formKey,
    child: Column(children: [
      AuthTextField(
        controller: widget.nameController, label: 'Full name',
        hint: 'Your name', prefixIcon: Icons.person_outline_rounded,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.name], validator: _nameValidator,
      ),
      const SizedBox(height: 16),
      AuthTextField(
        controller: widget.emailController, label: 'Email address',
        hint: 'name@example.com', prefixIcon: Icons.alternate_email_rounded,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.email], validator: _emailValidator,
      ),
      const SizedBox(height: 16),
      AuthTextField(
        controller: widget.passwordController, label: 'Password',
        hint: 'Create a password', prefixIcon: Icons.lock_outline_rounded,
        textInputAction: TextInputAction.next, obscureText: _hidePassword,
        autofillHints: const [AutofillHints.newPassword],
        validator: _passwordValidator,
        suffix: IconButton(
          onPressed: () => setState(() => _hidePassword = !_hidePassword),
          icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
        ),
      ),
      const SizedBox(height: 16),
      AuthTextField(
        controller: widget.confirmPasswordController, label: 'Confirm password',
        hint: 'Repeat your password', prefixIcon: Icons.verified_user_outlined,
        textInputAction: TextInputAction.done,
        obscureText: _hideConfirmation, validator: _confirmationValidator,
        suffix: IconButton(
          onPressed: () => setState(() => _hideConfirmation = !_hideConfirmation),
          icon: Icon(_hideConfirmation ? Icons.visibility_outlined : Icons.visibility_off_outlined),
        ),
      ),
    ]),
  );
}
