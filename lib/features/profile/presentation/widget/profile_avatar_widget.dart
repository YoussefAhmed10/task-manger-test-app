import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/profile/data/models/user_profile_model.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({super.key, required this.user});

  final UserProfileModel user;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 28.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 96.w,
            height: 96.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: user.imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: user.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => ProfileAvatarFallbackWidget(
                      initials: user.initials,
                    ),
                    errorWidget: (context, url, error) =>
                        ProfileAvatarFallbackWidget(
                          initials: user.initials,
                        ),
                  )
                : ProfileAvatarFallbackWidget(initials: user.initials),
          ),
          verticalSpace(16),
          Text(
            user.displayName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: colors.primaryText,
            ),
          ),
          verticalSpace(6),
          Text(
            user.displayEmail,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: colors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatarFallbackWidget extends StatelessWidget {
  const ProfileAvatarFallbackWidget({super.key, required this.initials});

  final String initials;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary, colors.primaryLight],
        ),
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
