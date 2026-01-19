import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._(); // Private constructor

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto', // Or standard
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.surfaceLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      surface: AppColors.surfaceLight,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimaryLight,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryLight,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryLight,
      ),
      bodyLarge: TextStyle(fontSize: 18, color: AppColors.textSecondaryLight),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.textSecondaryLight),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    cardColor: AppColors.surfaceDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.surfaceDark,
      error: AppColors.error,
      onPrimary: AppColors.backgroundDark,
      onSecondary: AppColors.backgroundDark,
      onSurface: AppColors.textPrimaryDark,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryDark,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryDark,
      ),
      bodyLarge: TextStyle(fontSize: 18, color: AppColors.textSecondaryDark),
      bodyMedium: TextStyle(fontSize: 16, color: AppColors.textSecondaryDark),
    ),
  );
}
