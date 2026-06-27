import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/app/splash_screen.dart';
import 'package:task_manager_test/core/di/dependency_injection.dart';
import 'package:task_manager_test/core/routing/routes.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';
import 'package:task_manager_test/features/home/presentation/screen/home_screen.dart';
import 'package:task_manager_test/features/login/presentation/screen/login_screen.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_cubit.dart';
import 'package:task_manager_test/features/signup/presentation/screen/signup_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SignupCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
