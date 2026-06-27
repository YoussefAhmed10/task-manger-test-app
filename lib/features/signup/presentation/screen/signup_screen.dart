import 'package:flutter/material.dart';
import 'package:task_manager_test/features/signup/presentation/widget/signup_form_widget.dart';
import 'package:task_manager_test/features/signup/presentation/widget/signup_header_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SignUpHeaderWidget()),
      bottomNavigationBar: SignupFormWidget(),
    );
  }
}
