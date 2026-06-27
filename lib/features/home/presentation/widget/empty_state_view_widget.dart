import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_image.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/features/home/presentation/widget/home_bloc_listener.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key, required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeBlocListener(),
        Expanded(
          child: RefreshIndicator(
            color: AppColors.darkBlueColor,
            onRefresh: onRefresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              children: [
                SizedBox(height: 80.h),
                Lottie.asset(AppImage.emptyStateLottie, fit: BoxFit.contain),
                verticalSpace(24),
                Text(
                  'No products found',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.fon18darkGreyColorRegular.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                verticalSpace(8),
                Text(
                  'Pull down to refresh',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.fon14darkBlueColorMedium.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
