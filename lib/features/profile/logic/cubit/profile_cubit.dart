import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/profile/data/repo/profile_repo.dart';
import 'package:task_manager_test/features/profile/logic/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.profileInitial());

  Future<void> loadProfile() async {
    emit(const ProfileState.profileLoading());
    final result = await _profileRepo.getCurrentUser();
    result.when(
      success: (user) => emit(ProfileState.profileLoaded(user: user)),
      failure: (error) =>
          emit(ProfileState.profileError(apiErrorModel: error)),
    );
  }

  Future<void> logout() async {
    emit(const ProfileState.profileLoading());
    await _profileRepo.logout();
    emit(const ProfileState.profileLogoutSuccess());
  }
}
