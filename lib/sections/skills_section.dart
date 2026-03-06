import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

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
    final theme = Theme.of(context);
    final categories = _buildCategories();

    return SectionContainer(
      key: sectionKey,
      color: Theme.of(context).colorScheme.surface,
      height: 720,
      titleCentered: true,
      child: Column(
        children: [
          const SectionHeader(
            title: AppStrings.skillsTitle,
            subtitle: AppStrings.skillsSubtitle,
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              final count = _crossAxisCount(constraints.maxWidth);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: ResponsiveLayout.isMobile(context)
                      ? 0.9
                      : 0.75,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) =>
                    _SkillCard(category: categories[index], theme: theme),
              );
            },
          ),
        ],
      ),
    );
  }

  int _crossAxisCount(double width) {
    if (width >= 1180) return 4;
    if (width >= 920) return 3;
    if (width >= 760) return 2;
    return 1;
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

class _SkillCard extends StatefulWidget {
  final _SkillCategory category;
  final ThemeData theme;

  const _SkillCard({required this.category, required this.theme});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = widget.theme.colorScheme;
    final primary = colorScheme.primary;
    final baseSurface = colorScheme.surface.withOpacity(0.82);
    final borderRadius = BorderRadius.circular(18);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: baseSurface,
          borderRadius: borderRadius,
          border: Border.all(
            color: _hovered
                ? primary.withOpacity(0.5)
                : colorScheme.outline.withOpacity(0.2),
            width: 1.1,
          ),
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(_hovered ? 0.32 : 0.18),
              blurRadius: _hovered ? 32 : 22,
              spreadRadius: _hovered ? 2 : 1,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(1.2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: colorScheme.surface.withOpacity(0.9),
            borderRadius: borderRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _IconHalo(
                icon: widget.category.icon,
                primary: primary,
                surface: baseSurface,
              ),
              const SizedBox(height: 14),
              Text(
                widget.category.title,
                textAlign: TextAlign.center,
                style: widget.theme.textTheme.displayMedium?.copyWith(
                  fontSize: 20,
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'SKILLS',
                style: widget.theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 6),
              ...widget.category.skills.map(
                (skill) => Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    skill,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: widget.theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withOpacity(0.85),
                      height: 1.25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconHalo extends StatelessWidget {
  final IconData icon;
  final Color primary;
  final Color surface;

  const _IconHalo({
    required this.icon,
    required this.primary,
    required this.surface,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: surface,
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.5),
            blurRadius: 26,
            spreadRadius: 1,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: primary,
          size: 28,
          shadows: [Shadow(color: primary.withOpacity(0.65), blurRadius: 22)],
        ),
      ),
    );
  }
}
