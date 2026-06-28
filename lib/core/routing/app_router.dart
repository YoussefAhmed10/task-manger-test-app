import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/app/splash_screen.dart';
import 'package:task_manager_test/core/di/dependency_injection.dart';
import 'package:task_manager_test/core/routing/routes.dart';
import 'package:task_manager_test/features/home/logic/cubit/home_cubit.dart';
import 'package:task_manager_test/features/home/presentation/screen/home_screen.dart';
import 'package:task_manager_test/features/login/presentation/screen/login_screen.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_cubit.dart';
import 'package:task_manager_test/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:task_manager_test/features/product_details/presentation/screen/product_details_screen.dart';
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
      case Routes.productDetailsScreen:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ProductDetailsCubit>(),
            child: ProductDetailsScreen(productId: productId),
          ),
        );
      default:
        return null;
    }
  }
}
