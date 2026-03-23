
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedSweepSvg extends StatefulWidget {
  final String assetPath;
  final double height;

  const AnimatedSweepSvg({
    super.key,
    required this.assetPath,
    required this.height,
  });

  @override
  State<AnimatedSweepSvg> createState() => _AnimatedSweepSvgState();
}

class _AnimatedSweepSvgState extends State<AnimatedSweepSvg>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.colorScheme.onSurface;
    final sweepColor = theme.colorScheme.secondary;

    // The SVG is built once; only the ShaderMask gradient repaints.
    final svgChild = SvgPicture.asset(
      widget.assetPath,
      fit: BoxFit.contain,
      height: widget.height,
      colorFilter: ColorFilter.mode(baseColor, BlendMode.srcIn),
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Animate gradient center from -0.3 → 1.3 so the highlight
        // enters and exits the visible area smoothly.
        final t = Curves.easeInOut.transform(_controller.value);
        final center = -0.3 + (t * 1.6); // range −0.3 → 1.3

        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white, // keep original tint
                sweepColor, // highlight
                Colors.white, // keep original tint
              ],
              stops: [
                (center - 0.12).clamp(0.0, 1.0),
                center.clamp(0.0, 1.0),
                (center + 0.12).clamp(0.0, 1.0),
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.modulate,
          child: child,
        );
      },
      child: svgChild,
    );
  }
}
