import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/product_details/data/models/review_model.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key, required this.review});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: colors.primaryContainer,
                child: Text(
                  _initials(review.reviewerName),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: colors.onPrimaryContainer,
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.reviewerName ?? 'Anonymous',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: colors.primaryText,
                      ),
                    ),
                    verticalSpace(2),
                    Text(
                      _formatDate(review.date),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              _RatingStars(rating: review.rating ?? 0),
            ],
          ),
          if (review.comment != null && review.comment!.isNotEmpty) ...[
            verticalSpace(12),
            Text(
              review.comment!,
              style: TextStyle(
                fontSize: 14.sp,
                color: colors.secondaryText,
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _initials(String? name) {
    if (name == null || name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return '';
    try {
      final date = DateTime.parse(dateStr);
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } catch (_) {
      return dateStr;
    }
  }
}

class _RatingStars extends StatelessWidget {
  const _RatingStars({required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
          size: 16.sp,
          color: index < rating
              ? const Color(0xFFFFB800)
              : colors.hintText.withValues(alpha: 0.4),
        );
      }),
    );
  }
}
