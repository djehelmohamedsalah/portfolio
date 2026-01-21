import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/project_card.dart';
import '../constants/app_strings.dart';
import '../models/project.dart';
import 'project_details_page.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      title: AppStrings.projectsTitle,
      color: Theme.of(context).colorScheme.surface,
      height: 800,
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: Project.allProjects.map((project) {
          return ProjectCard(
            title: project.title,
            description: project.overview,
            icon: project.icon,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailsPage(project: project),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
