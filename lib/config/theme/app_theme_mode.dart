import 'package:edutime/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeMode {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      // Primary colors
      primary: AppColors.primary500,
      onPrimary: AppColors.gray50,
      primaryContainer: AppColors.primary100,
      onPrimaryContainer: AppColors.primary900,

      // Secondary colors (using info colors as secondary)
      secondary: AppColors.info500,
      onSecondary: AppColors.gray50,
      secondaryContainer: AppColors.info100,
      onSecondaryContainer: AppColors.info900,

      // Tertiary colors (using success colors)
      tertiary: AppColors.success500,
      onTertiary: AppColors.gray50,
      tertiaryContainer: AppColors.success100,
      onTertiaryContainer: AppColors.success900,

      // Error colors
      error: AppColors.error500,
      onError: AppColors.gray50,
      errorContainer: AppColors.error100,
      onErrorContainer: AppColors.error900,

      // Background and surface colors
      surface: AppColors.gray50,
      onSurface: AppColors.gray950,
      onSurfaceVariant: AppColors.gray700,

      // Outline colors
      outline: AppColors.gray300,
      outlineVariant: AppColors.gray200,

      // Utility colors
      shadow: AppColors.gray700,
      scrim: AppColors.gray800,

      // Inverse colors
      inverseSurface: AppColors.gray950,
      onInverseSurface: AppColors.gray50,
      inversePrimary: AppColors.primary500,
    ),

    // Additional theme properties
    primaryColor: AppColors.primary500,
    scaffoldBackgroundColor: AppColors.gray50,
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      // Primary colors
      primary: AppColors.primary500,
      onPrimary: AppColors.primary950,
      primaryContainer: AppColors.primary900,
      onPrimaryContainer: AppColors.primary100,

      // Secondary colors (using info colors as secondary)
      secondary: AppColors.info500,
      onSecondary: AppColors.info950,
      secondaryContainer: AppColors.info900,
      onSecondaryContainer: AppColors.info100,

      // Tertiary colors (using success colors)
      tertiary: AppColors.success500,
      onTertiary: AppColors.success950,
      tertiaryContainer: AppColors.success900,
      onTertiaryContainer: AppColors.success100,

      // Error colors
      error: AppColors.error500,
      onError: AppColors.error950,
      errorContainer: AppColors.error900,
      onErrorContainer: AppColors.error100,

      // Background and surface colors
      surface: AppColors.gray950,
      onSurface: AppColors.gray50,
      onSurfaceVariant: AppColors.gray300,

      // Outline colors
      outline: AppColors.gray700,
      outlineVariant: AppColors.gray800,

      // Utility colors
      shadow: AppColors.gray950,
      scrim: AppColors.gray950,

      // Inverse colors
      inverseSurface: AppColors.gray50,
      onInverseSurface: AppColors.gray950,
      inversePrimary: AppColors.primary500,
    ),

    // Additional theme properties
    primaryColor: AppColors.primary500,
    scaffoldBackgroundColor: AppColors.gray950,
  );
}