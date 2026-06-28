import 'package:flutter/material.dart';
import 'package:task_manager_test/core/widget/keyboard_dismiss_wrapper.dart';
import 'package:task_manager_test/features/login/presentation/widget/header_authentication_widget.dart';
import 'package:task_manager_test/features/login/presentation/widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return KeyboardDismissWrapper(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: HeadrAuthenticationWidge()),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: const LoginFormWidget(),
        ),
      ),
    );
  }
}
