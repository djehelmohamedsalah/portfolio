import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';

class SectionContainer extends StatelessWidget {
  final String? title;
  final Widget child;
  final Color color;
  final double height;
  final bool titleCentered;
  const SectionContainer({
    super.key,
    this.title,
    required this.child,
    required this.color,
    required this.height,
    this.titleCentered = false,
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
          const SizedBox(height: 40),
          child,
        ],
      ),
    );
  }
}
