import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager_test/core/theming/app_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() => _buildTheme(
        brightness: Brightness.light,
        extension: AppThemeExtension.light,
      );

  static ThemeData darkTheme() => _buildTheme(
        brightness: Brightness.dark,
        extension: AppThemeExtension.dark,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required AppThemeExtension extension,
  }) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: extension.primary,
      onPrimary: Colors.white,
      secondary: extension.primaryLight,
      onSecondary: Colors.white,
      error: const Color(0xFFDC2626),
      onError: Colors.white,
      surface: extension.surface,
      onSurface: extension.primaryText,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: extension.scaffoldBackground,
      colorScheme: colorScheme,
      extensions: [extension],
      appBarTheme: AppBarTheme(
        backgroundColor: extension.appBarBackground,
        foregroundColor: extension.primaryText,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: extension.primaryText),
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: extension.primaryText,
        ),
      ),
      cardTheme: CardThemeData(
        color: extension.surface,
        elevation: isDark ? 0 : 2,
        shadowColor: extension.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isDark
              ? BorderSide(color: extension.border.withValues(alpha: 0.6))
              : BorderSide.none,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: extension.divider,
        thickness: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: extension.inputFill,
        hintStyle: TextStyle(color: extension.hintText),
        labelStyle: TextStyle(color: extension.primary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: extension.primary, width: 2.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: extension.primary, width: 2.2),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: extension.primary,
        foregroundColor: Colors.white,
        elevation: isDark ? 4 : 6,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: extension.primary,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return isDark ? const Color(0xFF6B6D7F) : Colors.white;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return extension.primary;
          }
          return isDark ? const Color(0xFF2E3148) : const Color(0xFFD1D5DB);
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      iconTheme: IconThemeData(color: extension.iconColor),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: extension.primaryText),
        bodyMedium: TextStyle(color: extension.primaryText),
        bodySmall: TextStyle(color: extension.secondaryText),
        titleLarge: TextStyle(
          color: extension.primaryText,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: extension.primaryText,
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(color: extension.primaryText),
      ),
    );
  }
}
