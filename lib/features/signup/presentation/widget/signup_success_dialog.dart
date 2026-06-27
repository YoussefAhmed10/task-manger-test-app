import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/widget/app_text_button.dart';

class SignupSuccessDialog extends StatelessWidget {
  final VoidCallback onBackToLogin;

  const SignupSuccessDialog({super.key, required this.onBackToLogin});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      backgroundColor: AppColors.whiteColor,
      insetPadding: REdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: REdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_rounded,
                color: const Color(0xFF2E7D32),
                size: 44.sp,
              ),
            ),
            verticalSpace(20),
            Text(
              'Registered Successfully!',
              textAlign: TextAlign.center,
              style: AppTextStyle.fon18darkGreyColorRegular.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            verticalSpace(12),
            Text(
              'Your account was created on the DummyJSON API.',
              textAlign: TextAlign.center,
              style: AppTextStyle.fon16lightBlackColorMedium.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            verticalSpace(16),
            Container(
              width: double.infinity,
              padding: REdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFFFE082)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: const Color(0xFFF57C00),
                    size: 22.sp,
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Text(
                      "You can't log in with this account because DummyJSON is a fake API — "
                      'registration is simulated and users are not actually saved.',
                      style: AppTextStyle.fon16lightBlackColorMedium.copyWith(
                        fontSize: 13.sp,
                        color: const Color(0xFF5D4037),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(24),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                buttonText: 'Back to Sign In',
                textStyle: AppTextStyle.fon16WhiteBold,
                onTap: onBackToLogin,
                buttonWidth: 327,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
