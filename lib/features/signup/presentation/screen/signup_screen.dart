import 'package:flutter/material.dart';
import 'package:task_manager_test/core/widget/keyboard_dismiss_wrapper.dart';
import 'package:task_manager_test/features/signup/presentation/widget/signup_form_widget.dart';
import 'package:task_manager_test/features/signup/presentation/widget/signup_header_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return KeyboardDismissWrapper(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SignUpHeaderWidget()),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: const SignupFormWidget(),
        ),
      ),
    );
  }
}
