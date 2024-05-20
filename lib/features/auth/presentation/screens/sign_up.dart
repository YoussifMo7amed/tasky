import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/refactors/SignUp_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: SignUpBody(),
      )
    );
  }
}