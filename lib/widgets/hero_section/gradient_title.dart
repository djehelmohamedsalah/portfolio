import 'package:flutter/material.dart';

class GradientTitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const GradientTitle({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradient = LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,

          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1.17,
          letterSpacing: -1.5,
        ),
      ),
    );
  }
}
