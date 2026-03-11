import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../constants/app_strings.dart';
import '../constants/app_layout.dart';
import 'toolbox_section.dart';

class _SkillCategory {
  final String title;
  final List<String> skills;
  final IconData icon;

  const _SkillCategory({
    required this.title,
    required this.skills,
    required this.icon,
  });
}

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final categories = _buildCategories();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SectionContainer(
      key: sectionKey,
      color: Theme.of(context).colorScheme.surface,
      height: 0,
      titleCentered: true,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SectionHeader(
                  title: AppStrings.skillsTitle,
                  subtitle: AppStrings.skillsSubtitle,
                ),
                const SizedBox(height: AppSpacing.blockGap),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getGridColumns(screenWidth),
                    crossAxisSpacing: 48,
                    mainAxisSpacing: 32,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) => _SkillColumn(
                    category: categories[index],
                    theme: theme,
                    colorScheme: colorScheme,
                  ),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                const ToolboxSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<_SkillCategory> _buildCategories() {
    return const [
      _SkillCategory(
        title: AppStrings.categoryMobileDev,
        skills: AppStrings.skillsMobileDev,
        icon: Icons.phone_android_rounded,
      ),
      _SkillCategory(
        title: AppStrings.categoryStateManagement,
        skills: AppStrings.skillsStateManagement,
        icon: Icons.hub_rounded,
      ),
      _SkillCategory(
        title: AppStrings.categoryBackendIntegration,
        skills: AppStrings.skillsBackendIntegration,
        icon: Icons.cloud_sync_rounded,
      ),
      _SkillCategory(
        title: AppStrings.categoryUiPerformance,
        skills: AppStrings.skillsUiPerformance,
        icon: Icons.speed_rounded,
      ),
    ];
  }
}

class _SkillColumn extends StatelessWidget {
  final _SkillCategory category;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _SkillColumn({
    required this.category,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    final primary = colorScheme.primary;
    final subtleIconBg = primary.withValues(alpha: 0.08);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: subtleIconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(category.icon, color: primary, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                category.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.itemGap),
        ...List.generate(
          category.skills.length,
          (i) => Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.itemGap),
            child: Text(
              category.skills[i],
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.78),
                height: 1.32,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
