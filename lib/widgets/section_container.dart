import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;
  final double height;
  const SectionContainer({
    super.key,
    required this.title,
    required this.child,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: height),
      color: color,
      padding: ResponsiveLayout.isMobile(context)
          ? const EdgeInsets.symmetric(vertical: 40, horizontal: 20)
          : const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 40),
          child,
        ],
      ),
    );
  }
}
