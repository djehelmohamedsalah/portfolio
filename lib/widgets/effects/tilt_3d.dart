import 'dart:math' as math;
import 'package:flutter/widgets.dart';

/// A reusable Flutter widget applying a high-performance 3D tilt hover effect.
/// Uses [ValueNotifier] to ensure minimal rebuilds and optimal performance.
class Tilt3D extends StatefulWidget {
  final Widget child;
  final double maxTilt;
  final double scale;
  final Duration duration;
  final bool enableGlare;

  const Tilt3D({
    super.key,
    required this.child,
    this.maxTilt = 10,
    this.scale = 1.03,
    this.duration = const Duration(milliseconds: 250),
    this.enableGlare = true,
  });

  @override
  State<Tilt3D> createState() => _Tilt3DState();
}

class _Tilt3DState extends State<Tilt3D> with SingleTickerProviderStateMixin {
  late AnimationController _resetController;
  late Animation<Offset> _resetAnimation;

  // Uses ValueNotifier to prevent full widget tree rebuilds during rapid mouse events
  final ValueNotifier<Offset> _tiltPosition = ValueNotifier<Offset>(
    Offset.zero,
  );
  final ValueNotifier<bool> _isHovered = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _resetController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _resetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _resetController, curve: Curves.easeOut));

    // Animate smoothly back to zero when mouse leaves
    _resetController.addListener(() {
      _tiltPosition.value = _resetAnimation.value;
    });
  }

  @override
  void didUpdateWidget(Tilt3D oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _resetController.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _resetController.dispose();
    _tiltPosition.dispose();
    _isHovered.dispose();
    super.dispose();
  }

  void _onEnter(Offset localPosition) {
    _resetController.stop();
    _isHovered.value = true;
    _updatePosition(localPosition);
  }

  void _onHover(Offset localPosition) {
    if (!_isHovered.value) {
      _resetController.stop();
      _isHovered.value = true;
    }
    _updatePosition(localPosition);
  }

  void _onExit() {
    _isHovered.value = false;
    _resetAnimation = Tween<Offset>(
      begin: _tiltPosition.value,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _resetController, curve: Curves.easeOut));
    _resetController.forward(from: 0);
  }

  void _updatePosition(Offset localPosition) {
    if (!mounted) return;
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) return;

    final Size size = renderObject.size;
    // Normalize coordinates to range [-1, 1], with (0,0) at the center
    final double dx = (localPosition.dx / size.width) * 2 - 1;
    final double dy = (localPosition.dy / size.height) * 2 - 1;

    _tiltPosition.value = Offset(dx.clamp(-1.0, 1.0), dy.clamp(-1.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onEnter(event.localPosition),
      onHover: (event) => _onHover(event.localPosition),
      onExit: (event) => _onExit(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanDown: (details) => _onEnter(details.localPosition),
        onPanUpdate: (details) => _onHover(details.localPosition),
        onPanEnd: (details) => _onExit(),
        onPanCancel: _onExit,
        child: ValueListenableBuilder<Offset>(
          valueListenable: _tiltPosition,
          builder: (context, offset, child) {
            return ValueListenableBuilder<bool>(
              valueListenable: _isHovered,
              builder: (context, isHovered, _) {
                // Calculate rotation based on cursor offset
                final double tiltX =
                    -offset.dy * (widget.maxTilt * math.pi / 180);
                final double tiltY =
                    offset.dx * (widget.maxTilt * math.pi / 180);

                final Matrix4 transform = Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Adds depth perspective
                  ..rotateX(tiltX)
                  ..rotateY(tiltY);

                return AnimatedScale(
                  scale: isHovered ? widget.scale : 1.0,
                  duration: widget.duration,
                  curve: Curves.easeOut,
                  child: Transform(
                    transform: transform,
                    alignment: FractionalOffset.center,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.passthrough,
                      children: [
                        widget.child,
                        // Configurable subtle light reflection effect
                        if (widget.enableGlare)
                          Positioned.fill(
                            child: IgnorePointer(
                              child: AnimatedOpacity(
                                opacity: isHovered ? 1.0 : 0.0,
                                duration: widget.duration,
                                curve: Curves.easeOut,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      colors: [
                                        const Color(
                                          0xFFFFFFFF,
                                        ).withValues(alpha: 0.15),
                                        const Color(
                                          0xFFFFFFFF,
                                        ).withValues(alpha: 0.0),
                                      ],
                                      center: Alignment(-offset.dx, -offset.dy),
                                      radius: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
