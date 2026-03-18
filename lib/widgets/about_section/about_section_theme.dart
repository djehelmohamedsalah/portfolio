import 'package:flutter/material.dart';

class AboutSectionTheme {
  AboutSectionTheme.of(this.context) : theme = Theme.of(context);

  final BuildContext context;
  final ThemeData theme;

  Color get surfaceOverlay => theme.colorScheme.surface.withValues(alpha: 0.35);
  BorderRadius get cardRadius => BorderRadius.circular(20);
  Color get avatarBorderColor => theme.colorScheme.primary.withValues(alpha: 0.3);

  Color get capsuleShadowColor => Colors.black.withValues(alpha: 0.15);
  Color get capsuleShadowBlurColor => Colors.black.withValues(alpha: 0.18);

  TextStyle? get bodyMobile => theme.textTheme.bodyMedium?.copyWith(height: 1.8);
  TextStyle? get bodyDesktop =>
      theme.textTheme.bodyMedium?.copyWith(height: 1.8, fontWeight: FontWeight.w600);

  Color get buttonBorder => theme.colorScheme.onTertiary;
  Color get buttonHoverBackground => theme.colorScheme.onTertiary;
  Color buttonLabel(bool hovering) => hovering
      ? theme.colorScheme.onPrimary
      : theme.colorScheme.onTertiary;
  TextStyle? buttonLabelStyle(bool hovering) => theme.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
        color: buttonLabel(hovering),
      );
}
