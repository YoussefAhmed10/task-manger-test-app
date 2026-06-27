import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_test/core/routing/routes.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_cubit.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () => Center(
            child: CircularProgressIndicator(color: AppColors.darkBlueColor),
          ),
          loginSuccess: (loginResponseBody) {
            Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
          },
          loginError: (error) => Fluttertoast.showToast(
            msg: error.message ?? 'Something went wrong',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
