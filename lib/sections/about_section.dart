import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';
import '../widgets/about_section/about_actions.dart';
import '../widgets/about_section/about_image.dart';
import '../widgets/about_section/about_section_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    final aboutTheme = AboutSectionTheme.of(context);

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
              const SectionHeader(
                title: AppStrings.aboutTitle,
                subtitle: AppStrings.aboutSubTitle,
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
                      child: Text(
                        AppStrings.aboutDescription.trim(),
                        style: aboutTheme.bodyMobile!.copyWith(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: mobileImageWidth,
                      child: const AboutImage(),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: layout.constrainedContentWidth,
                      child: const AboutActions(),
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
                      child: Text(
                        AppStrings.aboutDescription.trim(),
                        textAlign: TextAlign.center,
                        style: aboutTheme.bodyDesktop!.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: min(layout.constrainedContentWidth * 0.7, 420),
                      child: const AboutImage(),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: layout.constrainedContentWidth,
                      child: const AboutActions(),
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AboutImage(),
                    const SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.aboutDescription.trim(),
                            style: aboutTheme.bodyDesktop!.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 26),
                          const AboutActions(),
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
