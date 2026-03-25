import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/effects/reveal_on_scroll.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_header.dart';
import '../core/models/project.dart';
import '../widgets/projects_section/project_config.dart';
import '../widgets/projects_section/project_section.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<StringsProvider>().strings;
    final projects = Project.fromStrings(strings);
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
              RevealOnScroll(
                child: SectionHeader(
                  title: strings.projectsTitle,
                  subtitle: strings.projectsSubtitle,
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
