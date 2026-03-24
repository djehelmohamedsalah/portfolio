import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:mo_salah_dev/widgets/development_process/animated_sweep_svg.dart';
import 'package:mo_salah_dev/widgets/development_process/build_text_span.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_container.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_header.dart';
import '../core/utils/responsive_layout.dart';

class DevelopmentProcess extends StatelessWidget {
  final GlobalKey sectionKey;
  const DevelopmentProcess({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = context.watch<StringsProvider>().strings;
    return ResponsiveLayout(
      builder: (context, layout) {
        final isMobile = layout.isMobile;
        final isTablet = layout.isTablet;

        final descriptionStyle = theme.textTheme.bodyLarge?.copyWith(
          height: 1.8,
          fontWeight: FontWeight.w600,
          fontSize: isMobile
              ? 12
              : isTablet
              ? 14
              : 18,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
        );

        final boldStyle = descriptionStyle?.copyWith(
          fontWeight: FontWeight.w900,
          color: theme.colorScheme.onSurface,
        );

        return SectionContainer(
          key: sectionKey,
          titleCentered: true,
          color: theme.colorScheme.surface,
          height: 600,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SectionHeader(
                    title: strings.developmentProcessTitle,
                    subtitle: strings.developmentProcessSubtitle,
                  ),
                  const SizedBox(height: 48),
                  SelectableText.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: descriptionStyle,
                      children: buildTextSpans(
                        strings.developmentProcessDescription,
                        boldStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  AnimatedSweepSvg(
                    assetPath:
                        'lib/assets/photos/tools_icons/development_line.svg',
                    height: isMobile ? 80 : 160,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
