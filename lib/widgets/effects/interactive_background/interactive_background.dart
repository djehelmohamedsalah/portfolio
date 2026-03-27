import 'package:flutter/material.dart';
import 'interactive_mesh_painter.dart';
import 'interactive_spotlight_painter.dart';

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
                    painter: InteractiveMeshPainter(
                      animation: _controller,
                      mousePosition: _lerpedPosition,
                      colorScheme: Theme.of(context).colorScheme,
                      parallaxIntensity: parallaxIntensity,
                      isDark: isDark,
                      animationOpacity: animationOpacity,
                    ),
                    isComplex: true, // Hint to Flutter engine to cache if possible
                  ),

                  // Cursor Spotlight Layer (Disabled entirely on pure mobile widths)
                  if (!isMobile)
                    CustomPaint(
                      painter: InteractiveSpotlightPainter(
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
