import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/app/bloc_observer.dart';
import 'package:task_manager_test/app/task_manger_app.dart';
import 'package:task_manager_test/core/di/dependency_injection.dart';
import 'package:task_manager_test/core/routing/app_router.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();

  Bloc.observer = AppBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: TaskManagerApp(appRouter: AppRouter()),
    ),
  );
}
