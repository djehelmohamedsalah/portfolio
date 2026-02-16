import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../models/project.dart';
import '../widgets/projects_section/project_config.dart';
import '../widgets/projects_section/project_section.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projects = Project.allProjects;
    final caseStudies = projects.take(3).map((project) {
      return ProjectConfig(project: project);
    }).toList();

    return Column(
      key: sectionKey,
      children: [
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                AppStrings.projectsTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 860),
                child: Text(
                  AppStrings.projectsSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    height: 1.6,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ...caseStudies.map((config) {
          return ProjectSection(config: config);
        }),
      ],
    );
  }
}
