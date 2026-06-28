import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';

class AddProductDropdownFieldWidget extends StatelessWidget {
  const AddProductDropdownFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
    this.displayBuilder,
  });

  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;
  final String Function(String value)? displayBuilder;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return FormField<String>(
      key: ValueKey<String?>(value),
      initialValue: value,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyle.fon14darkBlueColorMedium.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: colors.primary,
              ),
            ),
            SizedBox(height: 8.h),
            DropdownButtonFormField<String>(
              initialValue: value,
              isExpanded: true,
              style: TextStyle(
                fontSize: 14.sp,
                color: colors.primaryText,
              ),
              hint: Text(
                hint,
                style: TextStyle(fontSize: 14.sp, color: colors.hintText),
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: colors.inputFill,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: colors.primary.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: colors.border,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: colors.primary,
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                errorText: field.errorText,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colors.primary,
                size: 24.sp,
              ),
              dropdownColor: colors.surface,
              borderRadius: BorderRadius.circular(12.r),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        displayBuilder?.call(item) ?? item,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: colors.primaryText,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (selected) {
                onChanged(selected);
                field.didChange(selected);
              },
            ),
          ],
        );
      },
    );
  }
}
