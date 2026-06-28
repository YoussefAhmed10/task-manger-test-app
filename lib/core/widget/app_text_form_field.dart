import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final bool? isObscureText;
  final bool? enabledEdit;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final int? maxLines;
  final double? borderRadius;
  final TextInputType? keyboardType;
  final String? requiredText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.hintText,
    this.hintTextStyle,
    this.labelText,
    this.labelTextStyle,
    required this.validator,
    this.enabledEdit,
    this.maxLines,
    this.borderRadius,
    this.keyboardType,
    this.onChanged,
    this.requiredText,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      readOnly: enabledEdit ?? false,
      cursorColor: colors.primary,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      style: inputTextStyle ??
          AppTextStyle.fon12BlackBold.copyWith(
            fontSize: 15.sp,
            color: colors.primaryText,
          ),
      decoration: InputDecoration(
        label: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: labelText ?? '',
                style: labelTextStyle ??
                    AppTextStyle.fon14darkBlueColorMedium.copyWith(
                      fontSize: 17.sp,
                      color: colors.primary,
                    ),
              ),
              WidgetSpan(child: horizontalSpace(5)),
              TextSpan(
                text: requiredText ?? '',
                style: AppTextStyle.fon17DarkRedBold.copyWith(fontSize: 17.sp),
              ),
            ],
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: backgroundColor ?? colors.inputFill,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          borderSide: BorderSide(color: colors.primary, width: 2.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          borderSide: BorderSide(color: colors.primary, width: 2.2),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        ),
        hintText: hintText ?? '',
        hintStyle: hintTextStyle ??
            AppTextStyle.fon18darkGreyColorRegular.copyWith(
              fontSize: 13.sp,
              color: colors.hintText,
            ),
        suffixIcon: suffixIcon,
      ),
      maxLines: maxLines ?? 1,
      obscureText: isObscureText ?? false,
      validator: (value) {
        return validator(value);
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      onFieldSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!(value);
        }
      },
    );
  }
}
