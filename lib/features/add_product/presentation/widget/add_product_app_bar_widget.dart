import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';

class AddProductAppBarWidget extends StatelessWidget {
  const AddProductAppBarWidget({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20.sp,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            'Add Product',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
