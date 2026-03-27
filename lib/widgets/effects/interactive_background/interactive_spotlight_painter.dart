import 'package:flutter/material.dart';

class InteractiveSpotlightPainter extends CustomPainter {
  final ValueNotifier<Offset?> mousePosition;
  final bool isDark;
  final double animationOpacity;

  InteractiveSpotlightPainter({
    required this.mousePosition,
    required this.isDark,
    required this.animationOpacity,
  }) : super(repaint: mousePosition);

  @override
  void paint(Canvas canvas, Size size) {
    if (mousePosition.value == null) return;

    // Force Hardware Compositing
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    final opacity = (0.03 * animationOpacity).clamp(0.0, 1.0);
    final blendMode = isDark ? BlendMode.plus : BlendMode.overlay;

    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withValues(
            alpha: opacity,
          ), // Very subtle premium glow layer
          Colors.white.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: mousePosition.value!, radius: 225))
      ..blendMode =
          blendMode; // Aggressive light additive mix suitable for spotlight beams

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant InteractiveSpotlightPainter oldDelegate) => false;
}
