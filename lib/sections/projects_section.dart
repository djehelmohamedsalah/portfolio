import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      title: "Projects",
      color: Theme.of(context).colorScheme.surface,
      height: 800,
      child: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          ProjectCard(
            title: "E-Commerce App",
            description:
                "A full-featured mobile shopping experience with cart and payment integration.",
            icon: Icons.shopping_bag,
          ),
          ProjectCard(
            title: "Portfolio Website",
            description:
                "This very website! Built with Flutter Web and custom scroll navigation.",
            icon: Icons.web,
          ),
          ProjectCard(
            title: "Task Manager",
            description:
                "Productivity tool for tracking daily tasks and team collaboration.",
            icon: Icons.check_circle_outline,
          ),
          ProjectCard(
            title: "Weather Dashboard",
            description:
                "Real-time weather tracking using REST APIs and geolocation.",
            icon: Icons.cloud,
          ),
        ],
      ),
    );
  }
}
