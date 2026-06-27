import 'package:flutter/material.dart';
import 'package:task_manager_test/features/login/presentation/widget/header_authentication_widget.dart';
import 'package:task_manager_test/features/login/presentation/widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HeadrAuthenticationWidge()),
      bottomNavigationBar: LoginFormWidget(),
    );
  }
}
