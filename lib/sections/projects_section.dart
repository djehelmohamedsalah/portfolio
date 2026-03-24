import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_header.dart';
import '../constants/app_strings.dart';
import '../models/project.dart';
import '../widgets/projects_section/project_config.dart';
import '../widgets/projects_section/project_section.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
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
              SectionHeader(
                title: AppStrings.projectsTitle,
                subtitle: AppStrings.projectsSubtitle,
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
