import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';

class ProfileInfoRowWidget extends StatelessWidget {
  const ProfileInfoRowWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Row(
      children: [
        Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: colors.onPrimaryContainer, size: 22.sp),
        ),
        horizontalSpace(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colors.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: colors.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
