import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_test/core/routing/routes.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_cubit.dart';
import 'package:task_manager_test/features/profile/logic/cubit/profile_cubit.dart';
import 'package:task_manager_test/features/profile/logic/cubit/profile_state.dart';

class ProfileBlocListener extends StatelessWidget {
  const ProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current is ProfileLogoutSuccess || current is ProfileError,
      listener: (context, state) {
        state.whenOrNull(
          profileLogoutSuccess: () {
            final loginCubit = context.read<LoginCubit>();
            loginCubit.loginResponseBody = null;
            loginCubit.usernameController.clear();
            loginCubit.passwordController.clear();

            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.loginScreen,
              (route) => false,
            );
          },
          profileError: (error) => Fluttertoast.showToast(
            msg: error.message ?? 'Failed to load profile',
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
