import 'package:flutter/material.dart';
import '../widget/login_widget/login_screen_body.dart';
import '../widget/shared/auth_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) => const AuthScaffold(child: LoginScreenBody());
}
