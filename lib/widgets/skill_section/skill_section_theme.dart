import 'package:flutter/material.dart';
import '../../core/utils/app_layout.dart';

class SkillSectionTheme {
  SkillSectionTheme.of(this.context)
    : theme = Theme.of(context),
      colorScheme = Theme.of(context).colorScheme;

  final BuildContext context;
  final ThemeData theme;
  final ColorScheme colorScheme;

  Color get overlaySurface => colorScheme.surface.withValues(alpha: 0.35);
  Color get dividerColor => theme.dividerColor.withValues(alpha: 0.2);
  BorderRadius get cardRadius => BorderRadius.circular(12);

  Color subtleIconBackground(Color primary) => primary.withValues(alpha: 0.08);

  TextStyle? titleStyle(AppLayout layout) =>
      theme.textTheme.titleLarge?.copyWith(
        fontSize: layout.isMobile
            ? 18
            : layout.isTablet
            ? 19
            : 20,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      );

  TextStyle? bodyStyle(AppLayout layout) => theme.textTheme.bodyLarge?.copyWith(
    fontSize: layout.isMobile
        ? 14
        : layout.isTablet
        ? 15
        : 16,
    color: colorScheme.onSurface.withValues(alpha: 0.78),
    height: 1.32,
    fontWeight: FontWeight.w400,
  );
}
