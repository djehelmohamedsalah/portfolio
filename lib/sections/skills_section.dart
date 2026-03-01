import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      color: Theme.of(context).colorScheme.surface,
      height: 500,
      titleCentered: true,
      child: Column(
        children: [
          const SectionHeader(
            title: AppStrings.skillsTitle,
            subtitle: AppStrings.skillsSubtitle,
          ),
          const SizedBox(height: 100),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = ResponsiveLayout.isMobile(context);

              if (isMobile) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategory(
                      context,
                      AppStrings.categoryMobileDev,
                      AppStrings.skillsMobileDev,
                    ),
                    const SizedBox(height: 40),
                    _buildCategory(
                      context,
                      AppStrings.categoryStateManagement,
                      AppStrings.skillsStateManagement,
                    ),
                    const SizedBox(height: 40),
                    _buildCategory(
                      context,
                      AppStrings.categoryBackendIntegration,
                      AppStrings.skillsBackendIntegration,
                    ),
                    const SizedBox(height: 40),
                    _buildCategory(
                      context,
                      AppStrings.categoryUiPerformance,
                      AppStrings.skillsUiPerformance,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildCategory(
                      context,
                      AppStrings.categoryMobileDev,
                      AppStrings.skillsMobileDev,
                    ),
                  ),
                  Expanded(
                    child: _buildCategory(
                      context,
                      AppStrings.categoryStateManagement,
                      AppStrings.skillsStateManagement,
                    ),
                  ),
                  Expanded(
                    child: _buildCategory(
                      context,
                      AppStrings.categoryBackendIntegration,
                      AppStrings.skillsBackendIntegration,
                    ),
                  ),
                  Expanded(
                    child: _buildCategory(
                      context,
                      AppStrings.categoryUiPerformance,
                      AppStrings.skillsUiPerformance,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
    BuildContext context,
    String title,
    List<String> skills,
  ) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        ...skills.map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              skill,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
