import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/network/api_result.dart';
import 'package:task_manager_test/features/signup/data/models/signup_request_body.dart';
import 'package:task_manager_test/features/signup/data/models/signup_response_body.dart';
import 'package:task_manager_test/features/signup/data/repo/signup_repo.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(const SignupState.signupInitial());

  SignupResponseBody? signupResponseBody;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<SignupResponseBody> registerUser({
    required SignupRequestBody requestBody,
  }) async {
    emit(const SignupState.signupLoading());
    final result = await signupRepo.registerUser(requestBody: requestBody);
    return result.when(
      success: (data) {
        emit(SignupState.signupSuccess(data: data));
        signupResponseBody = data;
        return data;
      },
      failure: (error) {
        emit(SignupState.signupError(apiErrorModel: error));
        return SignupResponseBody();
      },
    );
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
