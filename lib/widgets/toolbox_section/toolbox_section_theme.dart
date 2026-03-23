import 'package:flutter/material.dart';

class ToolboxSectionTheme {
  ToolboxSectionTheme.of(this.context)
      : theme = Theme.of(context),
        colorScheme = Theme.of(context).colorScheme;

  final BuildContext context;
  final ThemeData theme;
  final ColorScheme colorScheme;

  Color get tileBackground => colorScheme.surface;
  Color get tileBorder => theme.dividerColor.withValues(alpha: 0.25);
  BorderRadius get tileRadius => BorderRadius.circular(6);

  TextStyle? tileLabelStyle() => theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
      );
}
