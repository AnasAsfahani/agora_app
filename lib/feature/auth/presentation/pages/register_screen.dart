import 'package:flutter/material.dart';
import '../widget/register_widget/register_screen_body.dart';
import '../widget/shared/auth_scaffold.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) => const AuthScaffold(child: RegisterScreenBody());
}
