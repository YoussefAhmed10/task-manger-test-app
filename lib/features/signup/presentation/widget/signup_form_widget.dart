import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/app_rejex.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_text_style.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';
import 'package:task_manager_test/core/widget/app_text_button.dart';
import 'package:task_manager_test/core/widget/app_text_form_field.dart';
import 'package:task_manager_test/features/signup/data/models/signup_request_body.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_cubit.dart';
import 'package:task_manager_test/features/signup/logic/cubit/signup_state.dart';
import 'package:task_manager_test/features/signup/presentation/widget/signup_bloc_listener.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  bool isObscureText = true;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    final cubit = context.read<SignupCubit>();
    usernameController = cubit.usernameController;
    emailController = cubit.emailController;
    passwordController = cubit.passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: RPadding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: context.read<SignupCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                Text(
                  'Please fill your data',
                  style: AppTextStyle.fon18darkGreyColorRegular,
                ),
                verticalSpace(16),
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
                  controller: emailController,
                  validator: (input) {
                    if (input == null ||
                        input.isEmpty ||
                        !AppRegex.isEmailValid(input)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  labelText: 'Email',
                  hintText: 'please enter your email',
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
                      color: colors.hintText,
                    ),
                  ),
                ),
                verticalSpace(36),
                Text(
                  "By proceeding, you confirm your understanding and agreement to our Privacy Policy.",
                  style: AppTextStyle.fon16lightBlackColorMedium,
                ),
                verticalSpace(36),
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    if (state is SignupLoading) {
                      return Container(
                        width: 375.w,
                        height: 61.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.blackColor,
                              AppColors.lightBlackColor,
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
                      buttonText: 'Sign up',
                      textStyle: AppTextStyle.fon16WhiteBold,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        validateAndRegister(context);
                      },
                      buttonWidth: 375,
                      gradientColor1: AppColors.blackColor,
                      gradientColor2: AppColors.lightBlackColor,
                    );
                  },
                ),
                SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndRegister(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      final cubit = context.read<SignupCubit>();
      final requestBody = SignupRequestBody(
        username: cubit.usernameController.text,
        email: cubit.emailController.text,
        password: cubit.passwordController.text,
      );
      cubit.registerUser(requestBody: requestBody);
    }
  }
}
