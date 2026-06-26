import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/routing/app_router.dart';
import 'package:task_manager_test/core/routing/routes.dart';

class TaskManagerApp extends StatelessWidget {
  final AppRouter appRouter;

  const TaskManagerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _getDesignSize(context),
      builder: (context, child) => MaterialApp(
        title: 'Task Manager',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: appRouter.onGenerateRoute,
        theme: ThemeData(fontFamily: 'Inter'),
      ),
    );
  }

  Size _getDesignSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final shortestSide = size.shortestSide;
    final aspectRatio = size.width / size.height;

    // More precise tablet detection
    if (shortestSide >= 600) {
      // Check if it's more tablet-like (closer to 4:3 aspect ratio)
      if (aspectRatio >= 0.7 && aspectRatio <= 0.8) {
        // Typical tablet aspect ratio (iPad is 3:4 = 0.75)
        return const Size(768, 1024); // iPad portrait
      } else {
        // Large phone or unusual tablet
        return const Size(600, 960);
      }
    } else if (shortestSide >= 400) {
      return const Size(414, 896); // Large phones
    } else {
      return const Size(393, 852); // Regular phones
    }
  }
}
