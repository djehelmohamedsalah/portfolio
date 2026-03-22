import 'package:flutter/material.dart';
import 'package:mo_salah_dev/utils/app_layout.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';
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
    final categories = _buildCategories();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ResponsiveLayout(
      builder: (context, layout) {
        final crossAxisSpacing =
            layout.itemSpacing *
            (layout.isDesktop
                ? 4
                : layout.isTablet
                ? 3
                : 2);
        final mainAxisSpacing =
            layout.itemSpacing *
            (layout.isDesktop
                ? 3
                : layout.isTablet
                ? 2.5
                : 2);
        final cardAspectRatio = layout.isDesktop
            ? 0.95
            : layout.isTablet
            ? 1.0
            : 1.05;
        final crossAxisCount = layout.gridColumns;

        return SectionContainer(
          key: sectionKey,
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.35),
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
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: layout.itemSpacing),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: crossAxisSpacing,
                    mainAxisSpacing: mainAxisSpacing,
                    childAspectRatio: cardAspectRatio,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) => _SkillColumn(
                    category: categories[index],
                    theme: theme,
                    colorScheme: colorScheme,
                    layout: layout,
                  ),
                ),
                const ToolboxSection(),
              ],
            ),
          ),
        );
      },
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
  final AppLayout layout;

  const _SkillColumn({
    required this.category,
    required this.theme,
    required this.colorScheme,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    final primary = colorScheme.primary;
    final subtleIconBg = primary.withValues(alpha: 0.08);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      fontSize: layout.isMobile
          ? 18
          : layout.isTablet
          ? 19
          : 20,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    );
    final bodyStyle = theme.textTheme.bodyLarge?.copyWith(
      fontSize: layout.isMobile
          ? 14
          : layout.isTablet
          ? 15
          : 16,
      color: colorScheme.onSurface.withValues(alpha: 0.78),
      height: 1.32,
      fontWeight: FontWeight.w400,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
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
            SizedBox(width: layout.itemSpacing),
            Expanded(
              child: Text(
                category.title,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
            ),
          ],
        ),
        SizedBox(height: layout.itemSpacing),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: category.skills.length,
            separatorBuilder: (_, _) => SizedBox(height: layout.itemSpacing),
            itemBuilder: (context, i) => Text(
              category.skills[i],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: bodyStyle,
            ),
          ),
        ),
      ],
    );
  }
}
