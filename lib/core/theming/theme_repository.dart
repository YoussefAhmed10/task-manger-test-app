import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_test/core/helper/constants.dart';

class ThemeRepository {
  Future<ThemeMode> getSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(SharedPrefKeys.themeMode);
    return value == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      SharedPrefKeys.themeMode,
      mode == ThemeMode.dark ? 'dark' : 'light',
    );
  }
}
