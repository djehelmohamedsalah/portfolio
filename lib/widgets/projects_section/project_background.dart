import 'package:flutter/material.dart';
import 'project_config.dart';

class ProjectBackground extends StatelessWidget {
  final ProjectConfig config;

  const ProjectBackground({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final imagePath = config.project.logo;

    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: Opacity(
            opacity: 0.28,
            child: FractionallySizedBox(
              widthFactor: 0.42,
              heightFactor: 0.42,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.1),
                Color.fromRGBO(0, 0, 0, 0.0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ],
    );
  }
}
