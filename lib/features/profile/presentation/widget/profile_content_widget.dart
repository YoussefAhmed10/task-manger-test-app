import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/features/profile/data/models/user_profile_model.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_avatar_widget.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_info_card_widget.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_logout_button_widget.dart';

class ProfileContentWidget extends StatelessWidget {
  const ProfileContentWidget({super.key, required this.user});

  final UserProfileModel user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 32.h),
      child: Column(
        children: [
          ProfileAvatarWidget(user: user),
          verticalSpace(20),
          ProfileInfoCardWidget(user: user),
          verticalSpace(28),
          const ProfileLogoutButtonWidget(),
        ],
      ),
    );
  }
}
