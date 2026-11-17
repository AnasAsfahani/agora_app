import 'package:agora_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/login/login_request_model.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../shared/auth_primary_button.dart';

class LoginAction extends StatelessWidget {
  const LoginAction({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => BlocConsumer<AuthCubit, AuthState>(
    listenWhen: (_, state) => state.maybeWhen(
      authenticated: () => true,
      error: (_) => true,
      orElse: () => false,
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
        label: 'Sign in',
        isLoading: loading,
        onPressed: loading
            ? null
            : () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().login(
                    LoginRequestModel(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    ),
                  );
                }
              },
      );
    },
  );

  String _errorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Email or password is incorrect.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      default:
        return code.replaceAll('-', ' ');
    }
  }
}
