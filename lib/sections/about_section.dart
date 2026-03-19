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
        final isMobile = layout.isMobile;
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
                    Text(
                      AppStrings.aboutDescription.trim(),
                      style: aboutTheme.bodyMobile,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 26),
                    const AboutActions(),
                    const SizedBox(height: 40),
                    const Center(child: AboutImage()),
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
                            style: aboutTheme.bodyDesktop,
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
