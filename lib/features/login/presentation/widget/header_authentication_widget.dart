import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_image.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';

class HeadrAuthenticationWidge extends StatelessWidget {
  const HeadrAuthenticationWidge({
    super.key,
    this.spaceBetweenImageAndText = 20,
  });
  final double? spaceBetweenImageAndText;
  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpace(10),
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Welcome to Task Manager',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: colors.primaryText,
            ),
          ),
        ),
        verticalSpace(spaceBetweenImageAndText ?? 20),
        Center(
          child: Image.asset(AppImage.taskMangerImage, fit: BoxFit.contain),
        ),
      ],
    );
  }
}
