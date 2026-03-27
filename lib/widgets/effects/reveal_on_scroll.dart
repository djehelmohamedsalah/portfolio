import 'dart:async';
import 'package:flutter/material.dart';

enum RevealDirection { up, down, left, right, fade }

/// A highly optimized reusable widget that triggers a smooth reveal animation
/// only when it enters the viewport and reaches a custom trigger point.
/// Built for Flutter Web performance.
class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double slideOffset;
  final Duration duration;
  final RevealDirection direction;
  final double startingScale;

  /// Determines when the animation starts relative to the viewport.
  /// A value of 0.8 means the animation triggers when the widget reaches 80%
  /// of the screen height. 0.0 is top of screen, 1.0 is bottom of screen.
  final double revealOffset;

  final Curve curve;
  final bool repeat;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideOffset = 40.0,
    this.duration = const Duration(milliseconds: 600),
    this.direction = RevealDirection.up,
    this.startingScale = 0.96,
    this.revealOffset = 0.8,
    this.curve = Curves.easeOutCubic,
    this.repeat = false,
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

  List<ScrollPosition> _scrollPositions = [];
  bool _hasRevealed = false;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _setupAnimations();

    // Validate visibility on the first frame after layout constraints are established
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _checkAndReveal();
    });
  }

  void _setupAnimations() {
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
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
      case RevealDirection.up:
        beginOffset = Offset(0, widget.slideOffset);
        break;
      case RevealDirection.down:
        beginOffset = Offset(0, -widget.slideOffset);
        break;
      case RevealDirection.left:
        beginOffset = Offset(widget.slideOffset, 0);
        break;
      case RevealDirection.right:
        beginOffset = Offset(-widget.slideOffset, 0);
        break;
      case RevealDirection.fade:
        beginOffset = Offset.zero;
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(curvedAnimation);
  }

  @override
  void didUpdateWidget(covariant RevealOnScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.curve != widget.curve ||
        oldWidget.direction != widget.direction ||
        oldWidget.slideOffset != widget.slideOffset ||
        oldWidget.startingScale != widget.startingScale) {
      _setupAnimations();
    }
  }

  void _updateScrollListeners() {
    if (!mounted) return;
    
    final List<ScrollPosition> newPositions = [];
    context.visitAncestorElements((element) {
      if (element is StatefulElement && element.state is ScrollableState) {
        newPositions.add((element.state as ScrollableState).position);
      }
      return true; // continue checking up the tree
    });

    for (final pos in _scrollPositions) {
      if (!newPositions.contains(pos)) {
        pos.removeListener(_checkAndReveal);
      }
    }

    for (final pos in newPositions) {
      if (!_scrollPositions.contains(pos)) {
        pos.addListener(_checkAndReveal);
      }
    }

    _scrollPositions = newPositions;
  }

  void _removeScrollListeners() {
    for (final pos in _scrollPositions) {
      pos.removeListener(_checkAndReveal);
    }
    _scrollPositions.clear();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasRevealed || widget.repeat) {
      _updateScrollListeners();
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _removeScrollListeners();
    _controller.dispose();
    super.dispose();
  }

  void _checkAndReveal() {
    if (!mounted) return;

    // Fast exit to prevent layout calculations when already revealed and not repeating
    if (_hasRevealed && !widget.repeat) {
      _removeScrollListeners();
      return;
    }

    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;

    try {
      final double? screenHeight = MediaQuery.maybeSizeOf(context)?.height;
      if (screenHeight == null) return;

      final double triggerPoint = screenHeight * widget.revealOffset;

      // Extract raw global position (highly optimized vs. abstract parent offset calculations)
      final Offset globalPosition = renderObject.localToGlobal(Offset.zero);
      final double widgetTop = globalPosition.dy;
      final double widgetBottom = widgetTop + renderObject.size.height;

      // Trigger condition:
      // The widget's top has crossed the trigger point and part of the widget is visible on screen
      if (widgetTop <= triggerPoint && widgetBottom >= 0) {
        if (!_hasRevealed &&
            !(_controller.isAnimating || _controller.isCompleted)) {
          _triggerReveal();
        }
      } else {
        // Reset condition (Only when repeat is enabled):
        // When the widget is completely swept off the bottom of the screen
        if (widget.repeat && widgetTop > screenHeight) {
          if (_hasRevealed) {
            _resetReveal();
          }
        }
      }
    } catch (_) {
      // Graceful fallback for edge cases during async layout phase
    }
  }

  void _triggerReveal() {
    _hasRevealed = true;

    // Immediately unbind the scroll listener explicitly if not repeating, boosting performance
    if (!widget.repeat) {
      _removeScrollListeners();
    }

    if (widget.delay > Duration.zero) {
      _delayTimer?.cancel();
      _delayTimer = Timer(widget.delay, () {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.forward();
    }
  }

  void _resetReveal() {
    _hasRevealed = false;
    _delayTimer?.cancel();
    _controller.value = 0.0; // Snap reset to invisible
  }

  @override
  Widget build(BuildContext context) {
    // We compose the tree incrementally based on provided parameters, skipping unused wrappers.
    Widget tree = widget.child;

    if (widget.startingScale != 1.0) {
      tree = ScaleTransition(
        scale: _scaleAnimation,
        alignment: Alignment.center,
        child: tree,
      );
    }

    if (widget.direction != RevealDirection.fade) {
      // Use AnimatedBuilder with Transform.translate for pixel accurate offsets.
      tree = AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _slideAnimation.value,
            child: child,
          );
        },
        child:
            tree, // Pass the tree down so it isn't rebuilt inside the builder
      );
    }

    return FadeTransition(opacity: _opacityAnimation, child: tree);
  }
}
