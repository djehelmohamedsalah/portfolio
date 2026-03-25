import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum RevealDirection { up, down, left, right, fade }

/// A highly optimized reusable widget that triggers a smooth reveal animation
/// only when it enters the viewport during scrolling. Built for Flutter Web.
class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double offsetY;
  final Duration duration;
  final RevealDirection direction;
  final double startingScale;
  final double visibilityThreshold;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offsetY = 40.0,
    this.duration = const Duration(milliseconds: 600),
    this.direction = RevealDirection.up,
    this.startingScale = 0.96,
    this.visibilityThreshold = 0.2,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  ScrollPosition? _scrollPosition;
  bool _hasRevealed = false;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(curvedAnimation);
    _scaleAnimation = Tween<double>(
      begin: widget.startingScale,
      end: 1.0,
    ).animate(curvedAnimation);

    Offset beginOffset;
    switch (widget.direction) {
      case RevealDirection.up: // Enters from bottom, moving upwards
        beginOffset = Offset(0, widget.offsetY);
        break;
      case RevealDirection.down: // Enters from top, moving downwards
        beginOffset = Offset(0, -widget.offsetY);
        break;
      case RevealDirection.left: // Enters from right, moving left
        beginOffset = Offset(widget.offsetY, 0);
        break;
      case RevealDirection.right: // Enters from left, moving right
        beginOffset = Offset(-widget.offsetY, 0);
        break;
      case RevealDirection.fade: // No translation
        beginOffset = Offset.zero;
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(curvedAnimation);

    // Validate visibility on the first frame after layout constraints are established
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndReveal();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasRevealed) {
      final newScrollPosition = Scrollable.maybeOf(context)?.position;
      if (_scrollPosition != newScrollPosition) {
        _scrollPosition?.removeListener(_checkAndReveal);
        _scrollPosition = newScrollPosition;
        _scrollPosition?.addListener(_checkAndReveal);
      }
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _scrollPosition?.removeListener(_checkAndReveal);
    _controller.dispose();
    super.dispose();
  }

  void _checkAndReveal() {
    if (_hasRevealed || !mounted) return;

    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;

    bool isVisible = false;
    final RenderAbstractViewport? viewport = RenderAbstractViewport.maybeOf(
      renderObject,
    );

    if (viewport != null && _scrollPosition != null) {
      final double scrollOffset = _scrollPosition!.pixels;
      final double viewportDimension = _scrollPosition!.viewportDimension;

      try {
        final RevealedOffset offsetToReveal = viewport.getOffsetToReveal(
          renderObject,
          0.0,
        );
        final double widgetTopOffset = offsetToReveal.offset;
        final double viewportBottom = scrollOffset + viewportDimension;

        // Support both axis generically
        final double widgetSize = _scrollPosition!.axis == Axis.vertical
            ? renderObject.size.height
            : renderObject.size.width;

        if (viewportBottom >=
            widgetTopOffset + (widgetSize * widget.visibilityThreshold)) {
          isVisible = true;
        }
      } catch (e) {
        isVisible = _fallbackVisibilityCheck(renderObject);
      }
    } else {
      isVisible = _fallbackVisibilityCheck(renderObject);
    }

    if (isVisible) {
      _triggerReveal();
    }
  }

  bool _fallbackVisibilityCheck(RenderBox renderObject) {
    if (!mounted) return false;
    try {
      final double screenHeight = MediaQuery.sizeOf(context).height;
      final Offset globalPosition = renderObject.localToGlobal(Offset.zero);
      return globalPosition.dy +
              (renderObject.size.height * widget.visibilityThreshold) <=
          screenHeight;
    } catch (_) {
      // If layout constraints totally mismatch viewport coordinates, gracefully degrade
      return true;
    }
  }

  void _triggerReveal() {
    _hasRevealed = true;
    _scrollPosition?.removeListener(_checkAndReveal);

    if (widget.delay > Duration.zero) {
      _delayTimer = Timer(widget.delay, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget tree = widget.child;

    if (widget.startingScale != 1.0) {
      tree = ScaleTransition(
        scale: _scaleAnimation,
        alignment: Alignment.center,
        child: tree,
      );
    }

    if (widget.direction != RevealDirection.fade) {
      tree = AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _slideAnimation.value,
            child: child,
          );
        },
        child: tree,
      );
    }

    return FadeTransition(opacity: _opacityAnimation, child: tree);
  }
}
