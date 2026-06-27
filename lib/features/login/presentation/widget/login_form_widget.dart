import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/widget/app_text_button.dart';
import 'package:task_manager_test/core/widget/app_text_form_field.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_cubit.dart';
import 'package:task_manager_test/features/login/logic/cubit/login_state.dart';
import 'package:task_manager_test/features/login/presentation/widget/login_bloc_listener.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool isObscureText = true;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = context.read<LoginCubit>().usernameController;
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: context.read<LoginCubit>().formKey,
            child: Column(
              children: [
                verticalSpace(30),
                AppTextFormField(
                  controller: usernameController,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  labelText: 'Username',
                  hintText: 'please enter your username',
                ),
                verticalSpace(16),
                AppTextFormField(
                  controller: passwordController,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  labelText: 'Password',
                  hintText: 'please enter your password',
                  isObscureText: isObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.obsecureGreyColor,
                    ),
                  ),
                ),
                verticalSpace(10),
                verticalSpace(16),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Container(
                        width: 375.w,
                        height: 61.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.darkBlueColor,
                              AppColors.lightBlueColor,
                            ],
                          ),
                        ),
                        child: RPadding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      );
                    }
                    return AppTextButton(
                      buttonText: 'Sign in',
                      textStyle: AppTextStyle.fon16WhiteBold,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        validateAndLoginHCP(context);
                      },
                      buttonWidth: 375,
                    );
                  },
                ),
                verticalSpace(16),
                Center(
                  child: Text(
                    'Or',
                    style: AppTextStyle.fon10GreyColorMedium.copyWith(
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                verticalSpace(16),
                AppTextButton(
                  buttonText: 'Sign up',
                  textStyle: AppTextStyle.fon16WhiteBold,
                  onTap: () {},
                  buttonWidth: 375,
                  gradientColor1: AppColors.blackColor,
                  gradientColor2: AppColors.lightBlackColor,
                ),

                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndLoginHCP(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      final FormData formData = FormData.fromMap({
        'username': context.read<LoginCubit>().usernameController.text,
        'password': context.read<LoginCubit>().passwordController.text,
      });
      context.read<LoginCubit>().loginUser(formData: formData);
    }
  }
}
