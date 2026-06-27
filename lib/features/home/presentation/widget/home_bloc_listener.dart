import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_state.dart';

class HomeBlocListener extends StatelessWidget {
  const HomeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => current is HomeError,
      listener: (context, state) {
        state.whenOrNull(
          homeError: (error) => Fluttertoast.showToast(
            msg: error.message ?? 'Failed to load products',
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
