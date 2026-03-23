import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/floating_top_app_bar/section_header.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';
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
    final categories = _buildCategories();
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
                const SectionHeader(
                  title: AppStrings.skillsTitle,
                  subtitle: AppStrings.skillsSubtitle,
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
                              child: SkillCard(
                                category: category,
                                layout: layout,
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

  List<SkillCategory> _buildCategories() {
    return const [
      SkillCategory(
        title: AppStrings.categoryMobileDev,
        skills: AppStrings.skillsMobileDev,
        icon: Icons.phone_android_rounded,
      ),
      SkillCategory(
        title: AppStrings.categoryStateManagement,
        skills: AppStrings.skillsStateManagement,
        icon: Icons.hub_rounded,
      ),
      SkillCategory(
        title: AppStrings.categoryBackendIntegration,
        skills: AppStrings.skillsBackendIntegration,
        icon: Icons.cloud_sync_rounded,
      ),
      SkillCategory(
        title: AppStrings.categoryUiPerformance,
        skills: AppStrings.skillsUiPerformance,
        icon: Icons.speed_rounded,
      ),
    ];
  }
}
