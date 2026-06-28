import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_test/core/network/api_error_model.dart';
import 'package:task_manager_test/features/profile/data/models/user_profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.profileInitial() = ProfileInitial;
  const factory ProfileState.profileLoading() = ProfileLoading;
  const factory ProfileState.profileLoaded({
    required UserProfileModel user,
  }) = ProfileLoaded;
  const factory ProfileState.profileError({
    required ApiErrorModel apiErrorModel,
  }) = ProfileError;
  const factory ProfileState.profileLogoutSuccess() = ProfileLogoutSuccess;
}
