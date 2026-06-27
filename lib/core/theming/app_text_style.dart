import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';

class AppTextStyle {
  static TextStyle fon16WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle fon17DarkRedBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static TextStyle fon14darkBlueColorMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBlueColor,
  );

  static TextStyle fon12BlackBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle fon10GreyColorMedium = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );
  static TextStyle fon18darkGreyColorRegular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreyColor,
  );
}
