import 'dart:math' as math;
import 'package:flutter/material.dart';

class InteractiveMeshPainter extends CustomPainter {
  final Animation<double> animation;
  final ValueNotifier<Offset?> mousePosition;
  final ColorScheme colorScheme;
  final double parallaxIntensity;
  final bool isDark;
  final double animationOpacity;

  InteractiveMeshPainter({
    required this.animation,
    required this.mousePosition,
    required this.colorScheme,
    required this.parallaxIntensity,
    required this.isDark,
    required this.animationOpacity,
  }) : super(repaint: Listenable.merge([animation, mousePosition]));

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width == 0 || size.height == 0) return;

    // Force Hardware Compositing for proper blending calculation on light backgrounds
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    final center = Offset(size.width / 2, size.height / 2);

    // Mouse bounds normalization for subtlety constrained Parallax
    Offset parallaxOffset = Offset.zero;
    if (mousePosition.value != null && parallaxIntensity > 0) {
      final normX = (mousePosition.value!.dx / size.width) * 2 - 1;
      final normY = (mousePosition.value!.dy / size.height) * 2 - 1;

      // Max ±30 pixels of shift across whole screen movement bounds
      parallaxOffset = Offset(
        normX * -30 * parallaxIntensity,
        normY * -30 * parallaxIntensity,
      );
    }

    final t = animation.value * 2 * math.pi;

    // Adaptive blend mode logic
    final blendMode = isDark ? BlendMode.screen : BlendMode.overlay;

    // Theming fallbacks. Use primary/secondary with strong opacity reduction.
    final color1 = colorScheme.primary.withValues(
      alpha: (0.15 * animationOpacity).clamp(0.0, 1.0),
    );
    final color2 = colorScheme.secondary.withValues(
      alpha: (0.15 * animationOpacity).clamp(0.0, 1.0),
    );
    // Use tertiary if dynamically supported by Theme structure, otherwise fallback gracefully.
    final color3 =
        (colorScheme.tertiary != colorScheme.primary
                ? colorScheme.tertiary
                : colorScheme.primaryContainer)
            .withValues(alpha: (0.12 * animationOpacity).clamp(0.0, 1.0));

    // Three intersecting dynamic ambient blobs driven by mathematical phases
    _drawBlob(
      canvas: canvas,
      center: Offset(
        center.dx + math.cos(t) * 120 + parallaxOffset.dx * 1.5,
        center.dy + math.sin(t) * 120 + parallaxOffset.dy * 1.5,
      ),
      radius: size.width * 0.45,
      color: color1,
      blendMode: blendMode,
    );

    _drawBlob(
      canvas: canvas,
      center: Offset(
        size.width * 0.8 +
            math.sin(t + math.pi) * 180 +
            parallaxOffset.dx * 0.8,
        size.height * 0.2 +
            math.cos(t + math.pi) * 180 +
            parallaxOffset.dy * 0.8,
      ),
      radius: size.width * 0.35,
      color: color2,
      blendMode: blendMode,
    );

    _drawBlob(
      canvas: canvas,
      center: Offset(
        size.width * 0.2 +
            math.cos(t + math.pi / 2) * 200 +
            parallaxOffset.dx * 1.2,
        size.height * 0.8 +
            math.sin(t + math.pi / 2) * 200 +
            parallaxOffset.dy * 1.2,
      ),
      radius: size.width * 0.4,
      color: color3,
      blendMode: blendMode,
    );

    canvas.restore();
  }

  void _drawBlob({
    required Canvas canvas,
    required Offset center,
    required double radius,
    required Color color,
    required BlendMode blendMode,
  }) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, color.withValues(alpha: 0.0)],
        stops: const [0.1, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..blendMode = blendMode;

    canvas.drawCircle(center, radius, paint);
  }

  // Returns false because Listenable.merge controls the repaint signals externally
  @override
  bool shouldRepaint(covariant InteractiveMeshPainter oldDelegate) => false;
}
