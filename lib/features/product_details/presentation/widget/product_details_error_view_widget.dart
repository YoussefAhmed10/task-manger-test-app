import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/product_details_bloc_listener.dart';

class ProductDetailsErrorView extends StatelessWidget {
  const ProductDetailsErrorView({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Column(
      children: [
        const ProductDetailsBlocListener(),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 56.sp,
                    color: colors.secondaryText,
                  ),
                  verticalSpace(16),
                  Text(
                    'Could not load product',
                    style: AppTextStyle.fon18darkGreyColorRegular.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colors.primaryText,
                    ),
                  ),
                  verticalSpace(8),
                  Text(
                    'The product may be unavailable or there was a connection issue.',
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
