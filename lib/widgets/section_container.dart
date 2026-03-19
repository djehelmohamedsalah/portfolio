import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/mousse_scroll_indicator.dart';
import '../utils/responsive_layout.dart';

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
    final layout = context.layout;
    final horizontalPadding = layout.horizontalPadding;
    final verticalPadding = layout.sectionSpacing / 2;

    return Container(
      width: double.infinity,
      color: color,
      constraints: BoxConstraints(minHeight: height),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: layout.maxContentWidth),
          child: Column(
            crossAxisAlignment: titleCentered
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  textAlign: titleCentered ? TextAlign.center : TextAlign.start,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                SizedBox(height: layout.blockSpacing),
              ],
              child,
              if (ishero) ...[
                SizedBox(height: layout.blockSpacing),
                Center(
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: toAbout,
                    child: const MouseScrollIndicator(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
