import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool centered;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final alignment = centered
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(title, textAlign: textAlign, style: theme.textTheme.displayMedium),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Text(
              subtitle!,
              textAlign: textAlign,
              style: theme.textTheme.titleMedium?.copyWith(
                height: 1.6,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
