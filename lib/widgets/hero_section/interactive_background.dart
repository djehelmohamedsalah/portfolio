import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A performant interactive background designed for modern SaaS-style hero sections.
///
/// OPTIMIZATION HIGHLIGHTS:
/// 1. Uses [CustomPainter] 'repaint' parameter coupled to [ValueNotifier] and [AnimationController].
/// 2. Widget tree never rebuilds (`setState` is NOT used).
/// 3. Mouse positional smoothing (LERP) happens cleanly within an existing Animation frame callback.
/// 4. Handles touch gracefully by isolating desktop/tablet pointer events from mobile.
/// 5. Uses RepaintBoundary to cache layers safely and keep the GPU execution isolated.
class InteractiveBackground extends StatefulWidget {
  final Widget child;

  const InteractiveBackground({super.key, required this.child});

  @override
  State<InteractiveBackground> createState() => _InteractiveBackgroundState();
}

class _InteractiveBackgroundState extends State<InteractiveBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Track precise mouse inputs without rebuilding widget tree.
  final ValueNotifier<Offset?> _mousePosition = ValueNotifier<Offset?>(null);

  // Track lerped (smoothed) mouse movements.
  final ValueNotifier<Offset?> _lerpedPosition = ValueNotifier<Offset?>(null);

  @override
  void initState() {
    super.initState();
    // 20-second slow floating ambient mesh animation.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // High-performance LERP calculation hooked onto the vsync loop to prevent layout thrashing.
    _controller.addListener(_updateLerpedPosition);
  }

  void _updateLerpedPosition() {
    if (_mousePosition.value == null) return;

    if (_lerpedPosition.value == null) {
      _lerpedPosition.value = _mousePosition.value;
      return;
    }

    final current = _lerpedPosition.value!;
    final target = _mousePosition.value!;

    // LERP logic for premium cursor tracking smoothness
    final dx = current.dx + (target.dx - current.dx) * 0.08;
    final dy = current.dy + (target.dy - current.dy) * 0.08;

    // Threshold comparison avoids micro-repaints when perfectly still
    if ((dx - current.dx).abs() > 0.1 || (dy - current.dy).abs() > 0.1) {
      _lerpedPosition.value = Offset(dx, dy);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateLerpedPosition);
    _controller.dispose();
    _mousePosition.dispose();
    _lerpedPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Responsiveness scaling constraints
    final isMobile = size.width < 768;
    final isTablet = size.width >= 768 && size.width < 1024;
    final parallaxIntensity = isMobile ? 0.0 : (isTablet ? 0.5 : 1.0);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final animationOpacity = isDark ? 1.0 : 1.35;

    return MouseRegion(
      onHover: (event) {
        if (!isMobile) _mousePosition.value = event.localPosition;
      },
      onExit: (_) {
        // Clear cursor on exit cleanly
        _mousePosition.value = null;
        _lerpedPosition.value = null;
      },
      child: Stack(
        children: [
          // Isolate Animation Into Its Own Layer
          Positioned.fill(
            child: RepaintBoundary(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Ambient Animated Mesh Layer
                  CustomPaint(
                    painter: _MeshPainter(
                      animation: _controller,
                      mousePosition: _lerpedPosition,
                      colorScheme: Theme.of(context).colorScheme,
                      parallaxIntensity: parallaxIntensity,
                      isDark: isDark,
                      animationOpacity: animationOpacity,
                    ),
                    isComplex:
                        true, // Hint to Flutter engine to cache if possible
                  ),

                  // Cursor Spotlight Layer (Disabled entirely on pure mobile widths)
                  if (!isMobile)
                    CustomPaint(
                      painter: _SpotlightPainter(
                        mousePosition: _lerpedPosition,
                        isDark: isDark,
                        animationOpacity: animationOpacity,
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Existing Hero Content bounds safely inside
          widget.child,
        ],
      ),
    );
  }
}

class _MeshPainter extends CustomPainter {
  final Animation<double> animation;
  final ValueNotifier<Offset?> mousePosition;
  final ColorScheme colorScheme;
  final double parallaxIntensity;
  final bool isDark;
  final double animationOpacity;

  _MeshPainter({
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
    final color1 = colorScheme.primary.withOpacity(
      (0.15 * animationOpacity).clamp(0.0, 1.0),
    );
    final color2 = colorScheme.secondary.withOpacity(
      (0.15 * animationOpacity).clamp(0.0, 1.0),
    );
    // Use tertiary if dynamically supported by Theme structure, otherwise fallback gracefully.
    final color3 =
        (colorScheme.tertiary != colorScheme.primary
                ? colorScheme.tertiary
                : colorScheme.primaryContainer)
            .withOpacity((0.12 * animationOpacity).clamp(0.0, 1.0));

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
        colors: [color, color.withOpacity(0.0)],
        stops: const [0.1, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..blendMode = blendMode;

    canvas.drawCircle(center, radius, paint);
  }

  // Returns false because Listenable.merge controls the repaint signals externally
  @override
  bool shouldRepaint(covariant _MeshPainter oldDelegate) => false;
}

class _SpotlightPainter extends CustomPainter {
  final ValueNotifier<Offset?> mousePosition;
  final bool isDark;
  final double animationOpacity;

  _SpotlightPainter({
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
          Colors.white.withOpacity(opacity), // Very subtle premium glow layer
          Colors.white.withOpacity(0.0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: mousePosition.value!, radius: 225))
      ..blendMode =
          blendMode; // Aggressive light additive mix suitable for spotlight beams

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _SpotlightPainter oldDelegate) => false;
}
