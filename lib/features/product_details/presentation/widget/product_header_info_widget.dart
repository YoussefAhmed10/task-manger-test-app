import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/chip_label_widget.dart';

class ProductHeaderInfoWidget extends StatelessWidget {
  const ProductHeaderInfoWidget({super.key, required this.product});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    final isInStock =
        product.availabilityStatus?.toLowerCase().contains('in stock') ?? false;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              if (product.category != null)
                ChipLabelWidget(
                  label: product.category!,
                  backgroundColor: AppColors.darkBlueColor.withValues(
                    alpha: 0.1,
                  ),
                  textColor: AppColors.darkBlueColor,
                ),
              if (product.brand != null)
                ChipLabelWidget(
                  label: product.brand!,
                  backgroundColor: AppColors.lighterBlueColor.withValues(
                    alpha: 0.15,
                  ),
                  textColor: AppColors.darkBlueColor,
                ),
              if (product.availabilityStatus != null)
                ChipLabelWidget(
                  label: product.availabilityStatus!,
                  backgroundColor: isInStock
                      ? const Color(0xFF22C55E).withValues(alpha: 0.12)
                      : const Color(0xFFEF4444).withValues(alpha: 0.12),
                  textColor: isInStock
                      ? const Color(0xFF16A34A)
                      : const Color(0xFFDC2626),
                ),
            ],
          ),
          verticalSpace(14),
          Text(
            product.title ?? '',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
              height: 1.3,
            ),
          ),
          verticalSpace(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${product.price?.toStringAsFixed(2) ?? '—'}',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkBlueColor,
                ),
              ),
              if (product.reviews?.isNotEmpty == true) ...[
                horizontalSpace(16),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 20.sp,
                        color: const Color(0xFFFFB800),
                      ),
                      horizontalSpace(4),
                      Text(
                        product.averageRating.toStringAsFixed(1),
                        style: AppTextStyle.fon12BlackBold.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
