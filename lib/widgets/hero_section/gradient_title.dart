import 'package:flutter/material.dart';
import 'package:mo_salah_dev/utils/responsive_layout.dart';

class GradientTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;

  const GradientTitle({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradient = LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return ResponsiveLayout(
      builder: (context, layout) {
        final isMobile = layout.isMobile;
        return ShaderMask(
          shaderCallback: (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: SelectableText(
            text,
            style: TextStyle(
              fontSize: isMobile ? 28 : fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.17,
              letterSpacing: -1.5,
            ),
            textAlign: textAlign,
          ),
        );
      },
    );
  }
}
