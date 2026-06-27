import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/helper/cache_helper.dart';
import 'package:task_manager_test/core/helper/constants.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/login/data/models/login_request_body.dart';
import 'package:task_manager_test/features/login/data/models/login_response_body.dart';
import 'package:task_manager_test/features/login/data/repo/login_repo.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.loginInitial());
  LoginResponseBody? loginResponseBody;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<LoginResponseBody> loginUser({
    required LoginRequestBody requestBody,
  }) async {
    emit(LoginState.loginLoading());
    final result = await loginRepo.loginUser(requestBody: requestBody);
    return result.when(
      success: (data) async {
        if (data.accessToken != null && data.accessToken!.isNotEmpty) {
          await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.userToken,
            data.accessToken!,
          );
          isLoggedInUser = true;
        }

        emit(LoginState.loginSuccess(data: data));
        loginResponseBody = data;
        return data;
      },
      failure: (error) {
        emit(LoginState.loginError(apiErrorModel: error));
        return LoginResponseBody();
      },
    );
  }
}
