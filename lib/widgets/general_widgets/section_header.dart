import 'package:flutter/material.dart';
import 'package:mo_salah_dev/core/utils/responsive_layout.dart';

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

    return ResponsiveLayout(
      builder: (context, layout) {
        final isMobile = layout.isMobile;
        return Column(
          crossAxisAlignment: alignment,
          children: [
            SelectableText(
              title,
              textAlign: textAlign,
              style: isMobile
                  ? theme.textTheme.displayMedium!.copyWith(fontSize: 20)
                  : theme.textTheme.displayMedium,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 860),
                child: SelectableText(
                  subtitle!,
                  textAlign: textAlign,
                  style: isMobile
                      ? theme.textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.85,
                          ),
                        )
                      : theme.textTheme.titleMedium?.copyWith(
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.85,
                          ),
                        ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
