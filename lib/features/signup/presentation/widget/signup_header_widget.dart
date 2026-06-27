import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_image.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sign up', style: AppTextStyle.fon32DarkBlueBold),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.darkBlueColor,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          verticalSpace(12),
          Center(
            child: Image.asset(AppImage.taskMangerImage, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}
