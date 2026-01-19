import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Base Palette - Professional Modern
  // Primary - Indigo/Violet range for a trustworthy tech feel
  static const Color primaryLight = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryDark = Color(0xFF818CF8); // Indigo 400

  // Secondary - Teal/Emerald for freshness and accent
  static const Color secondaryLight = Color(0xFF0D9488); // Teal 600
  static const Color secondaryDark = Color(0xFF2DD4BF); // Teal 400

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF8FAFC); // Slate 50
  static const Color backgroundDark = Color(0xFF0F172A); // Slate 900

  // Surface/Cards
  static const Color surfaceLight = Color(0xFFFFFFFF); // White
  static const Color surfaceDark = Color(0xFF1E293B); // Slate 800

  // Text
  static const Color textPrimaryLight = Color(0xFF1E293B); // Slate 800
  static const Color textPrimaryDark = Color(0xFFF8FAFC); // Slate 50
  static const Color textSecondaryLight = Color(0xFF64748B); // Slate 500
  static const Color textSecondaryDark = Color(0xFF94A3B8); // Slate 400

  // Error
  static const Color error = Color(0xFFEF4444); // Red 500

  // Legacy/Direct Colors (Keeping wrappers for compatibility or standard use)
  static const Color white = Colors.white;
  static const Color white70 = Colors.white70;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Aliases for simple access if needed (prefer Theme.of(context))
  static const Color primary =
      primaryDark; // Default to dark for backward compat if accessed directly
  static const Color slate800 = surfaceDark;
  static const Color sky400 =
      primaryDark; // Mapping old specific names to new primary
  static const Color teal400 =
      secondaryDark; // Mapping old specific names to new secondary
}
