
import 'package:flutter/material.dart';


class MouseScrollIndicator extends StatefulWidget {
  const MouseScrollIndicator({super.key});

  @override
  State<MouseScrollIndicator> createState() => MouseScrollIndicatorState();
}

class MouseScrollIndicatorState extends State<MouseScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 4.0,
      end: 12.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSurface.withValues(alpha: 0.4);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: color, width: 2),
          ),
          padding: const EdgeInsets.only(top: 4),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: _animation.value,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
