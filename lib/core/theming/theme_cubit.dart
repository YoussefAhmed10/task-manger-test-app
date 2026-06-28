import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_test/core/theming/theme_repository.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._themeRepository) : super(ThemeMode.light);

  final ThemeRepository _themeRepository;

  Future<void> loadSavedTheme() async {
    final savedMode = await _themeRepository.getSavedThemeMode();
    emit(savedMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (state == mode) return;
    await _themeRepository.saveThemeMode(mode);
    emit(mode);
  }

  Future<void> toggleTheme() async {
    final newMode =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newMode);
  }
}
