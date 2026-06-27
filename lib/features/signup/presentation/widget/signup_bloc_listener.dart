import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_cubit.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_state.dart';
import 'package:task_manager_test/features/signup/presentation/widget/signup_success_dialog.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupSuccess: (data) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => SignupSuccessDialog(
                onBackToLogin: () {
                  Navigator.of(dialogContext).pop();
                  Navigator.of(context).pop();
                },
              ),
            );
          },
          signupError: (error) => Fluttertoast.showToast(
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
