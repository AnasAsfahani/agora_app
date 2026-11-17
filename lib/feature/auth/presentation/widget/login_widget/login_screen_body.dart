import 'package:agora_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/auth_header.dart';
import 'login_action.dart';
import 'login_form.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});
  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const AuthHeader(
        title: 'Welcome back',
        subtitle: 'Sign in to continue to your voice conversations.',
      ),
      const SizedBox(height: 36),
      LoginForm(formKey: _formKey, emailController: _emailController,
        passwordController: _passwordController),
      const SizedBox(height: 24),
      LoginAction(formKey: _formKey, emailController: _emailController,
        passwordController: _passwordController),
      const SizedBox(height: 24),
      Center(child: TextButton(
        onPressed: () => context.go(Routes.register),
        child: const Text("Don't have an account? Create one"),
      )),
    ],
  );
}
