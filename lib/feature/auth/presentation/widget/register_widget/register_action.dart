import 'package:agora_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/register/register_request_model.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../shared/auth_primary_button.dart';

class RegisterAction extends StatelessWidget {
  const RegisterAction({
    required this.formKey, required this.nameController,
    required this.emailController, required this.passwordController,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthCubit, AuthState>(
    listenWhen: (_, state) => state.maybeWhen(
      authenticated: () => true, error: (_) => true, orElse: () => false,
    ),
    listener: (context, state) => state.maybeWhen(
      authenticated: () => context.go(Routes.voiceCall),
      error: (message) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(_errorMessage(message))));
      },
      orElse: () {},
    ),
    buildWhen: (previous, current) =>
      previous.maybeWhen(loading: () => true, orElse: () => false) ||
      current.maybeWhen(loading: () => true, orElse: () => false),
    builder: (context, state) {
      final loading = state.maybeWhen(loading: () => true, orElse: () => false);
      return AuthPrimaryButton(
        label: 'Create account', isLoading: loading,
        onPressed: loading ? null : () {
          if (formKey.currentState?.validate() ?? false) {
            context.read<AuthCubit>().register(RegisterRequestModel(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text,
            ));
          }
        },
      );
    },
  );

  String _errorMessage(String code) {
    switch (code) {
      case 'email-already-in-use': return 'An account already exists for this email.';
      case 'invalid-email': return 'The email address is invalid.';
      case 'weak-password': return 'Choose a stronger password.';
      case 'operation-not-allowed': return 'Email/password sign-up is not enabled.';
      case 'too-many-requests': return 'Too many attempts. Try again later.';
      default: return code.replaceAll('-', ' ');
    }
  }
}
