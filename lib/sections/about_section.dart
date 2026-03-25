import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/animations%20effects/reveal_on_scroll.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_header.dart';
import '../widgets/general_widgets/section_container.dart';
import '../core/utils/responsive_layout.dart';
import '../widgets/about_section/about_actions.dart';
import '../widgets/about_section/about_image.dart';
import '../widgets/about_section/about_section_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    final aboutTheme = AboutSectionTheme.of(context);
    final strings = context.watch<StringsProvider>().strings;

    return ResponsiveLayout(
      builder: (context, layout) {
        final bool isMobile = layout.isMobile;
        final bool isTablet = layout.isTablet;
        final double mobileImageWidth = min(
          layout.constrainedContentWidth * 0.85,
          360,
        );

        return SectionContainer(
          key: sectionKey,
          color: aboutTheme.surfaceOverlay,
          height: 600,
          titleCentered: true,
          child: Column(
            children: [
              RevealOnScroll(
                child: SectionHeader(
                  title: strings.aboutTitle,
                  subtitle: strings.aboutSubTitle,
                ),
              ),
              const SizedBox(height: 48),
              if (isMobile)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: layout.horizontalPadding,
                      ),
                      child: RevealOnScroll(
                        child: SelectableText(
                          strings.aboutDescription.trim(),
                          style: aboutTheme.bodyMobile!.copyWith(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    RevealOnScroll(
                      child: SizedBox(
                        width: mobileImageWidth,
                        child: const AboutImage(),
                      ),
                    ),
                    const SizedBox(height: 28),
                    RevealOnScroll(
                      child: SizedBox(
                        width: layout.constrainedContentWidth,
                        child: const AboutActions(),
                      ),
                    ),
                  ],
                )
              else if (isTablet)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: layout.horizontalPadding,
                      ),
                      child: RevealOnScroll(
                        child: SelectableText(
                          strings.aboutDescription.trim(),
                          textAlign: TextAlign.center,
                          style: aboutTheme.bodyDesktop!.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    RevealOnScroll(
                      child: SizedBox(
                        width: min(layout.constrainedContentWidth * 0.7, 420),
                        child: const AboutImage(),
                      ),
                    ),
                    const SizedBox(height: 28),
                    RevealOnScroll(
                      child: SizedBox(
                        width: layout.constrainedContentWidth,
                        child: const AboutActions(),
                      ),
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RevealOnScroll(child: const AboutImage()),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RevealOnScroll(
                            child: SelectableText(
                              strings.aboutDescription.trim(),
                              style: aboutTheme.bodyDesktop!.copyWith(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 26),
                          RevealOnScroll(child: const AboutActions()),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
