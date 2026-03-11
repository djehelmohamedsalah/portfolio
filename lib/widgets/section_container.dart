import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';
import '../constants/app_layout.dart';

class SectionContainer extends StatelessWidget {
  final String? title;
  final Widget child;
  final Color color;
  final double height;
  final bool titleCentered;
  final bool ishero;
  final VoidCallback? toAbout;
  const SectionContainer({
    this.toAbout,
    super.key,
    this.title,
    required this.child,
    required this.color,
    required this.height,
    this.titleCentered = false,
    this.ishero = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: height),
      color: color,
      padding: ResponsiveLayout.isMobile(context)
          ? const EdgeInsets.symmetric(vertical: 40, horizontal: 20)
          : const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        crossAxisAlignment: titleCentered
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          title == null
              ? const SizedBox()
              : Text(
                  title!,
                  textAlign: titleCentered ? TextAlign.center : TextAlign.start,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
          const SizedBox(height: AppSpacing.blockGap),
          child,
          ishero
              ? Center(
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: toAbout,
                    child: const _MouseScrollIndicator(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _MouseScrollIndicator extends StatefulWidget {
  const _MouseScrollIndicator();

  @override
  State<_MouseScrollIndicator> createState() => _MouseScrollIndicatorState();
}

class _MouseScrollIndicatorState extends State<_MouseScrollIndicator>
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
