import 'package:agora_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/auth_header.dart';
import 'register_action.dart';
import 'register_form.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});
  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const AuthHeader(
        title: 'Create your account',
        subtitle: 'Join Agora and start connecting through voice.',
      ),
      const SizedBox(height: 30),
      RegisterForm(
        formKey: _formKey, nameController: _nameController,
        emailController: _emailController, passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
      ),
      const SizedBox(height: 24),
      RegisterAction(
        formKey: _formKey, nameController: _nameController,
        emailController: _emailController, passwordController: _passwordController,
      ),
      const SizedBox(height: 20),
      Center(child: TextButton(
        onPressed: () => context.go(Routes.login),
        child: const Text('Already have an account? Sign in'),
      )),
    ],
  );
}
