import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/profile/data/models/user_profile_model.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_info_row_widget.dart';

class ProfileInfoCardWidget extends StatelessWidget {
  const ProfileInfoCardWidget({super.key, required this.user});

  final UserProfileModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.darkGreyColor.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Information',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
            ),
          ),
          verticalSpace(20),
          ProfileInfoRowWidget(
            icon: Icons.person_outline_rounded,
            label: 'Full Name',
            value: user.displayName,
          ),
          verticalSpace(18),
          ProfileInfoRowWidget(
            icon: Icons.email_outlined,
            label: 'Email',
            value: user.displayEmail,
          ),
        ],
      ),
    );
  }
}
