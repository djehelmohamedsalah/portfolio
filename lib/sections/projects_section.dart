import 'package:flutter/material.dart';
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
      children: caseStudies.map((config) {
        return ProjectSection(config: config);
      }).toList(),
    );
  }
}
