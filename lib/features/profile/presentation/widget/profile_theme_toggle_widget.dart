import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/core/theming/theme_cubit.dart';

class ProfileThemeToggleWidget extends StatelessWidget {
  const ProfileThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: colors.border),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF2A2D4A)
                      : colors.primaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  color: colors.onPrimaryContainer,
                  size: 22.sp,
                ),
              ),
              horizontalSpace(14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appearance',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: colors.primaryText,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      isDark ? 'Dark mode enabled' : 'Light mode enabled',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: colors.secondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Switch.adaptive(
                value: isDark,
                onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
              ),
            ],
          ),
        );
      },
    );
  }
}
