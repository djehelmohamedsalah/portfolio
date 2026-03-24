import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- LIGHT MODE PALETTE (Earth & Harvest) ---
  static const Color primaryLight = Color(0xFF254F22); // Deep Forest Green
  static const Color secondaryLight = Color(0xFFA03A13); // Burnt Sienna
  static const Color accentLight = Color(0xFFF5824A); // Soft Orange

  // Backgrounds & Surfaces (Derived from #EDE4C2)
  static const Color backgroundLight = Color(0xFFF9F6E5); // Lighter Cream
  static const Color surfaceLight = Color(0xFFEDE4C2); // Your Palette Beige

  // Text for Light Mode
  static const Color textPrimaryLight = Color(
    0xFF1B2E18,
  ); // Darker shade of your green
  static const Color textSecondaryLight = Color(
    0xFF7D6E5D,
  ); // Muted earthy brown

  // --- DARK MODE PALETTE (Midnight Rust) ---
  static const Color primaryDark = Color(0xFF2D4263); // Deep Navy
  static const Color secondaryDark = Color(0xFFC84B31); // Rust Red
  static const Color accentDark = Color(0xFFECDBBA); // Champagne Accent

  // Backgrounds & Surfaces (Derived from #191919)
  static const Color backgroundDark = Color(0xFF191919); // Your Palette Black
  static const Color surfaceDark = Color(
    0xFF242424,
  ); // Slightly lifted charcoal

  // Text for Dark Mode
  static const Color textPrimaryDark = Color(
    0xFFECDBBA,
  ); // Using your Beige for text
  static const Color textSecondaryDark = Color(0xFF94A3B8); // Muted blue-grey

  // --- SHARED & UTILITY ---
  static const Color error = Color(0xFFB91C1C);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Aliases for backward compatibility
  static const Color primary = primaryLight;
  static const Color slate800 = Color(0xFF1E293B);
}
