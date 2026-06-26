import 'package:flutter/material.dart';
import 'package:task_manager_test/app/splash_screen.dart';
import 'package:task_manager_test/core/routing/routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return null;
    }
  }
}
