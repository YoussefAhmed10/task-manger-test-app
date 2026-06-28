import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_bloc_listener.dart';

class ProfileErrorViewWidget extends StatelessWidget {
  const ProfileErrorViewWidget({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

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
                    color: colors.secondaryText,
                  ),
                  verticalSpace(16),
                  Text(
                    'Could not load profile',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: colors.primaryText,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'Please check your connection and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: colors.secondaryText,
                      height: 1.4,
                    ),
                  ),
                  verticalSpace(24),
                  TextButton(
                    onPressed: onRetry,
                    child: Text(
                      'Try again',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: colors.primary,
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
