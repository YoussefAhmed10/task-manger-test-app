import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_test/core/network/api_error_model.dart';
import 'package:task_manager_test/features/signup/data/models/signup_response_body.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.signupInitial() = SignupInitial;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupSuccess({
    required SignupResponseBody data,
  }) = SignupSuccess;
  const factory SignupState.signupError({
    required ApiErrorModel apiErrorModel,
  }) = SignupError;
}
