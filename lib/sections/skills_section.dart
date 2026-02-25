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
      height: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: AppStrings.skillsTitle,
            subtitle: AppStrings.skillsSubtitle,
            centered: true,
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = ResponsiveLayout.isMobile(context);
              // Calculate width: on desktop show 3 per row (with spacing), on mobile 1 per row
              final double spacing = 30.0;
              final double itemWidth = isMobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth - (spacing * 2)) / 3;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  _buildCategory(context, AppStrings.categoryMobileDev, [
                    AppStrings.skillFlutterDart,
                    AppStrings.skillCleanArchitecture,
                    AppStrings.skillModularArchitecture,
                    AppStrings.skillResponsiveLayouts,
                    AppStrings.skillNativeChannels,
                  ], itemWidth),
                  _buildCategory(context, AppStrings.categoryStateManagement, [
                    AppStrings.skillBlocPattern,
                    AppStrings.skillGetX,
                    AppStrings.skillReactiveProgramming,
                    AppStrings.skillPersistentState,
                    AppStrings.skillStateScoping,
                  ], itemWidth),
                  _buildCategory(
                    context,
                    AppStrings.categoryBackendIntegration,
                    [
                      AppStrings.skillSupabase,
                      AppStrings.skillRestApiIntegration,
                      AppStrings.skillAuthLogic,
                      AppStrings.skillRealtimeSync,
                      AppStrings.skillSecurePersistence,
                    ],
                    itemWidth,
                  ),
                  _buildCategory(context, AppStrings.categoryVersionControl, [
                    AppStrings.skillGitWorkflow,
                    AppStrings.skillCodeReview,
                    AppStrings.skillFeatureBranching,
                    AppStrings.skillCicdIntegration,
                    AppStrings.skillAgileWorkflow,
                  ], itemWidth),
                  _buildCategory(context, AppStrings.categoryUiPerformance, [
                    AppStrings.skillPixelPerfect,
                    AppStrings.skillAnimations,
                    AppStrings.skillPerformanceProfiling,
                    AppStrings.skillAssetOptimization,
                    AppStrings.skillWidgetLifecycle,
                  ], itemWidth),
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
    double width,
  ) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 320),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.1),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: theme.colorScheme.primary.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      skill,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.8,
                        ),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
