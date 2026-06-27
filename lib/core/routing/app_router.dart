import 'package:flutter/material.dart';
import 'package:task_manager_test/app/splash_screen.dart';
import 'package:task_manager_test/core/routing/routes.dart';
import 'package:task_manager_test/features/login/presentation/screen/login_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
