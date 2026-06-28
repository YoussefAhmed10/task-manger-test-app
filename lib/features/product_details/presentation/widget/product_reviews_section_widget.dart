import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/product_details/data/models/product_detail_model.dart';
import 'package:task_manager_test/features/product_details/presentation/widget/review_card_widget.dart';

class ProductReviewsSectionWidget extends StatelessWidget {
  const ProductReviewsSectionWidget({super.key, required this.product});

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context) {
    final reviews = product.reviews ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Customer Reviews',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
            const Spacer(),
            if (reviews.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB800).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 16.sp,
                      color: const Color(0xFFFFB800),
                    ),
                    horizontalSpace(4),
                    Text(
                      product.averageRating.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    horizontalSpace(4),
                    Text(
                      '(${reviews.length})',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        verticalSpace(16),
        if (reviews.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.darkGreyColor.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.rate_review_outlined,
                  size: 40.sp,
                  color: AppColors.greyColor,
                ),
                verticalSpace(8),
                Text(
                  'No reviews yet',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          )
        else
          ...reviews.map(
            (review) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ReviewCardWidget(review: review),
            ),
          ),
      ],
    );
  }
}
