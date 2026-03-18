import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/mousse_scroll_indicator.dart';
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
                    child: const MouseScrollIndicator(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
