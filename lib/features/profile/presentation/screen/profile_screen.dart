import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/features/profile/logic/cubit/profile_cubit.dart';
import 'package:task_manager_test/features/profile/logic/cubit/profile_state.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_app_bar_widget.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_bloc_listener.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_content_widget.dart';
import 'package:task_manager_test/features/profile/presentation/widget/profile_error_view_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            ProfileAppBarWidget(
              onBack: () => Navigator.of(context).pop(),
            ),
            const ProfileBlocListener(),
            Expanded(
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                      ),
                    );
                  }
                  if (state is ProfileError) {
                    return ProfileErrorViewWidget(
                      onRetry: () =>
                          context.read<ProfileCubit>().loadProfile(),
                    );
                  }
                  if (state is ProfileLoaded) {
                    return ProfileContentWidget(user: state.user);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
