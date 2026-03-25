import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/animations%20effects/reveal_on_scroll.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_header.dart';
import '../core/utils/responsive_layout.dart';
import '../widgets/general_widgets/section_container.dart';
import '../widgets/skill_section/skill_card.dart';
import '../widgets/skill_section/skill_category.dart';
import '../widgets/skill_section/skill_section_theme.dart';
import 'toolbox_section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.sectionKey});

  final GlobalKey sectionKey;

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<StringsProvider>().strings;
    final categories = [
      SkillCategory(
        title: strings.categoryMobileDev,
        skills: strings.skillsMobileDev,
        icon: Icons.phone_android_rounded,
      ),
      SkillCategory(
        title: strings.categoryStateManagement,
        skills: strings.skillsStateManagement,
        icon: Icons.hub_rounded,
      ),
      SkillCategory(
        title: strings.categoryBackendIntegration,
        skills: strings.skillsBackendIntegration,
        icon: Icons.cloud_sync_rounded,
      ),
      SkillCategory(
        title: strings.categoryUiPerformance,
        skills: strings.skillsUiPerformance,
        icon: Icons.speed_rounded,
      ),
    ];
    final skillTheme = SkillSectionTheme.of(context);

    return ResponsiveLayout(
      builder: (context, layout) {
        return SectionContainer(
          key: sectionKey,
          color: skillTheme.overlaySurface,
          height: 0,
          titleCentered: true,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RevealOnScroll(
                  child: SectionHeader(
                    title: strings.skillsTitle,
                    subtitle: strings.skillsSubtitle,
                  ),
                ),
                SizedBox(height: layout.blockSpacing),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final availableWidth = constraints.maxWidth;
                    final horizontalSpacing = layout.isDesktop
                        ? layout.blockSpacing * 0.6
                        : layout.isTablet
                        ? layout.blockSpacing * 0.5
                        : layout.blockSpacing * 0.45;
                    final runSpacing = layout.isDesktop
                        ? layout.blockSpacing * 0.5
                        : layout.isTablet
                        ? layout.blockSpacing * 0.55
                        : layout.blockSpacing * 0.6;

                    double cardWidth;
                    if (layout.isDesktop) {
                      cardWidth =
                          (availableWidth - (horizontalSpacing * 3)) / 4;
                    } else if (layout.isTablet) {
                      cardWidth = (availableWidth - horizontalSpacing) / 2;
                    } else {
                      cardWidth = availableWidth;
                    }

                    return Wrap(
                      alignment: layout.isDesktop
                          ? WrapAlignment.spaceBetween
                          : WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: horizontalSpacing,
                      runSpacing: runSpacing,
                      children: categories
                          .map(
                            (category) => ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: cardWidth,
                                maxWidth: cardWidth,
                              ),
                              child: RevealOnScroll(
                                child: SkillCard(
                                  category: category,
                                  layout: layout,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                SizedBox(height: layout.blockSpacing),
                const ToolboxSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
