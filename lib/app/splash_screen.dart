// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_test/core/helper/spacing_sizedbox.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';
import 'package:task_manager_test/core/theming/app_image.dart';
import 'package:task_manager_test/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool androidIs12OrAbove = false; // Initialize with default value
  bool _isLoading = true; // Add loading state
  @override
  void initState() {
    super.initState();
    android12OrAbove();
  }

  Future<void> android12OrAbove() async {
    androidIs12OrAbove = Platform.isAndroid
        ? await isAndroid12OrAbove()
        : false;
    setState(() {
      _isLoading = false; // Update loading state
    });
    await initSplashScreen(context: context);
  }

  Future<bool> isAndroid12OrAbove() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    // Android 12 corresponds to API level 31
    return androidInfo.version.sdkInt >= 31;
  }

  Future<void> initSplashScreen({required BuildContext context}) async {
    if (androidIs12OrAbove && !Platform.isIOS) {
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Task Manager'),
        ),
      );
    } else {
      Timer(const Duration(seconds: 4), () {
        if (!mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Task Manager'),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink();
    }
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: androidIs12OrAbove && !Platform.isIOS
          ? const SizedBox.shrink()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AppImage.splashImage1,
                    fit: BoxFit.contain,
                    width: 370.w,
                  ),
                ),
                verticalSpace(8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Task ',
                        style: TextStyle(color: AppColors.blackColor),
                      ),
                      TextSpan(
                        text: 'Manager',
                        style: TextStyle(color: AppColors.lightBlueColor),
                      ),
                    ],
                  ),
                ),
                verticalSpace(8),
                Text(
                  'Manage your tasks efficiently',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                    height: 1.5,
                  ),
                ),
                // // Spacer(),
                // // Image.asset(AppImage.splashImage2, fit: BoxFit.contain),
              ],
            ),
    );
  }
}
