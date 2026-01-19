import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/project_card.dart';
import '../constants/app_strings.dart';

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
        children: [
          ProjectCard(
            title: AppStrings.projectPortfolioTitle,
            description: AppStrings.projectPortfolioDesc,
            icon: Icons.web,
          ),
          ProjectCard(
            title: AppStrings.projectEcommerceTitle,
            description: AppStrings.projectEcommerceDesc,
            icon: Icons.shopping_bag,
          ),
          ProjectCard(
            title: AppStrings.projectTaskAppTitle,
            description: AppStrings.projectTaskAppDesc,
            icon: Icons.check_circle_outline,
          ),
          ProjectCard(
            title: AppStrings.projectWeatherTitle,
            description: AppStrings.projectWeatherDesc,
            icon: Icons.cloud,
          ),
        ],
      ),
    );
  }
}
