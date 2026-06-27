import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager_test/core/network/api_error_model.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.loginInitial() = LoginInitial;
  const factory LoginState.loginLoading() = LoginLoading;
  const factory LoginState.loginSuccess({required T data}) = LoginSuccess;
  const factory LoginState.loginError({required ApiErrorModel apiErrorModel}) =
      LoginError;
}
