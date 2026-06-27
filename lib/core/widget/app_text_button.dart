import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? imageWidth;
  final double? imageHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onTap;
  final Color? gradientColor1;
  final Color? gradientColor2;
  final String? imagePath;
  final Widget? buttonWidget;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.imageWidth,
    this.imageHeight,
    this.imagePath,
    required this.buttonText,
    required this.textStyle,
    required this.onTap,
    this.gradientColor1,
    this.gradientColor2,
    this.buttonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth?.w ?? 214.w,
        height:
            buttonHeight?.h ??
            (MediaQuery.of(context).size.width > 600 ? 70.h : 61.h),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 0.w,
          vertical: verticalPadding?.h ?? 0.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
          color: backgroundColor ?? AppColors.whiteColor,
          gradient: LinearGradient(
            colors: [
              gradientColor1 ?? AppColors.darkBlueColor,
              gradientColor2 ?? AppColors.lightBlueColor,
            ],
          ),
        ),
        child: Center(
          child:
              buttonWidget ??
              (imagePath == null
                  ? Text(buttonText, style: textStyle)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(buttonText, style: textStyle),
                        horizontalSpace(10),
                        Image.asset(
                          imagePath!,
                          width: imageWidth ?? 20.w,
                          height: imageHeight ?? 20.h,
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
