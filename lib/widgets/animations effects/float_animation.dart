import 'package:flutter/material.dart';

class FloatAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double beginOffset;
  final double endOffset;
  final Curve curve;

  const FloatAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 2500),
    this.beginOffset = -20.0,
    this.endOffset = 10.0,
    this.curve = Curves.easeInOut,
  });

  @override
  State<FloatAnimation> createState() => _FloatAnimationState();
}

class _FloatAnimationState extends State<FloatAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: widget.beginOffset, end: widget.endOffset)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(FloatAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration ||
        oldWidget.beginOffset != widget.beginOffset ||
        oldWidget.endOffset != widget.endOffset ||
        oldWidget.curve != widget.curve) {
      _controller.duration = widget.duration;
      _animation = Tween<double>(begin: widget.beginOffset, end: widget.endOffset)
          .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
      if (!_controller.isAnimating) {
        _controller.repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
