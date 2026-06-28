import 'package:flutter/material.dart';
import 'package:task_manager_test/core/theming/app_colors.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.scaffoldBackground,
    required this.surface,
    required this.surfaceElevated,
    required this.primary,
    required this.primaryLight,
    required this.primaryText,
    required this.secondaryText,
    required this.hintText,
    required this.border,
    required this.iconColor,
    required this.shadow,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.inputFill,
    required this.appBarBackground,
    required this.divider,
  });

  final Color scaffoldBackground;
  final Color surface;
  final Color surfaceElevated;
  final Color primary;
  final Color primaryLight;
  final Color primaryText;
  final Color secondaryText;
  final Color hintText;
  final Color border;
  final Color iconColor;
  final Color shadow;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color inputFill;
  final Color appBarBackground;
  final Color divider;

  static const light = AppThemeExtension(
    scaffoldBackground: Color(0xFFF5F5F5),
    surface: AppColors.whiteColor,
    surfaceElevated: AppColors.whiteColor,
    primary: AppColors.darkBlueColor,
    primaryLight: AppColors.lightBlueColor,
    primaryText: AppColors.blackColor,
    secondaryText: AppColors.greyColor,
    hintText: AppColors.darkGreyColor,
    border: Color(0x1F969696),
    iconColor: AppColors.darkBlueColor,
    shadow: Color(0x14000000),
    primaryContainer: Color(0x1A2D3075),
    onPrimaryContainer: AppColors.darkBlueColor,
    inputFill: AppColors.whiteColor,
    appBarBackground: AppColors.whiteColor,
    divider: Color(0x1F969696),
  );

  static const dark = AppThemeExtension(
    scaffoldBackground: Color(0xFF0D0F1A),
    surface: Color(0xFF161829),
    surfaceElevated: Color(0xFF1C1F33),
    primary: Color(0xFF7B7FE0),
    primaryLight: Color(0xFF9497EB),
    primaryText: Color(0xFFF0F1F5),
    secondaryText: Color(0xFF9496AB),
    hintText: Color(0xFF6B6D7F),
    border: Color(0xFF2E3148),
    iconColor: Color(0xFFA8AAE0),
    shadow: Color(0x4D000000),
    primaryContainer: Color(0x267B7FE0),
    onPrimaryContainer: Color(0xFF9497EB),
    inputFill: Color(0xFF1C1F33),
    appBarBackground: Color(0xFF161829),
    divider: Color(0xFF2A2D45),
  );

  @override
  AppThemeExtension copyWith({
    Color? scaffoldBackground,
    Color? surface,
    Color? surfaceElevated,
    Color? primary,
    Color? primaryLight,
    Color? primaryText,
    Color? secondaryText,
    Color? hintText,
    Color? border,
    Color? iconColor,
    Color? shadow,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? inputFill,
    Color? appBarBackground,
    Color? divider,
  }) {
    return AppThemeExtension(
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      hintText: hintText ?? this.hintText,
      border: border ?? this.border,
      iconColor: iconColor ?? this.iconColor,
      shadow: shadow ?? this.shadow,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      inputFill: inputFill ?? this.inputFill,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      divider: divider ?? this.divider,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      hintText: Color.lerp(hintText, other.hintText, t)!,
      border: Color.lerp(border, other.border, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}

extension AppThemeContext on BuildContext {
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>()!;
}
