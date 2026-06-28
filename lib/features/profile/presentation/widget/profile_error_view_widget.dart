import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_bloc_listener.dart';

class ProfileErrorViewWidget extends StatelessWidget {
  const ProfileErrorViewWidget({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileBlocListener(),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person_off_outlined,
                    size: 56.sp,
                    color: AppColors.greyColor,
                  ),
                  verticalSpace(16),
                  Text(
                    'Could not load profile',
                    style: AppTextStyle.fon18darkGreyColorRegular.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'Please check your connection and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                      height: 1.4,
                    ),
                  ),
                  verticalSpace(24),
                  TextButton(
                    onPressed: onRetry,
                    child: Text(
                      'Try again',
                      style: AppTextStyle.fon14darkBlueColorMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
