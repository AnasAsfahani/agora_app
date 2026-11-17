import 'package:flutter/material.dart';
import '../shared/auth_text_field.dart';
import 'login_validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.formKey, required this.emailController,
    required this.passwordController, super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) => Form(
    key: widget.formKey,
    child: Column(children: [
      AuthTextField(
        controller: widget.emailController, label: 'Email address',
        hint: 'name@example.com', prefixIcon: Icons.alternate_email_rounded,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        autofillHints: const [AutofillHints.username, AutofillHints.email],
        validator: LoginValidators.email,
      ),
      const SizedBox(height: 18),
      AuthTextField(
        controller: widget.passwordController, label: 'Password',
        hint: 'Enter your password', prefixIcon: Icons.lock_outline_rounded,
        textInputAction: TextInputAction.done, obscureText: _hidePassword,
        autofillHints: const [AutofillHints.password],
        validator: LoginValidators.password,
        suffix: IconButton(
          tooltip: _hidePassword ? 'Show password' : 'Hide password',
          onPressed: () => setState(() => _hidePassword = !_hidePassword),
          icon: Icon(_hidePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
        ),
      ),
    ]),
  );
}
