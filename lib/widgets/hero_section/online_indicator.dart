import 'package:flutter/material.dart';
import '../../constants/app_layout.dart';
import '../../utils/responsive_layout.dart';

class OnlineIndicator extends StatelessWidget {
  final Color color;
  final String label;
  final TextStyle? textStyle;

  const OnlineIndicator({
    super.key,
    required this.color,
    required this.label,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final theme = Theme.of(context);
    final effectiveTextStyle =
        textStyle ??
        theme.textTheme.labelLarge?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
        );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: layout.constrainedContentWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: color.withValues(alpha: 0.22)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Dot(color: color),
            SizedBox(width: AppSpacing.itemGap),
            Flexible(
              child: Text(label, style: effectiveTextStyle, softWrap: true),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 120),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
