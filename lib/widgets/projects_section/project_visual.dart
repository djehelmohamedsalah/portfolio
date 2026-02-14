import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../utils/responsive_layout.dart';

class ProjectVisual extends StatelessWidget {
  final Project project;

  const ProjectVisual({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return _MockupStack(project: project);
  }
}

class _MockupStack extends StatelessWidget {
  final Project project;

  const _MockupStack({required this.project});

  @override
  Widget build(BuildContext context) {
    final phoneImage = project.imageOverview;
    final isMobile = ResponsiveLayout.isMobile(context);
    final phoneWidth = isMobile ? 180.0 : 220.0;

    return Center(
      child: _MockupImage(
        imagePath: phoneImage,
        width: phoneWidth,
        aspectRatio: 9 / 19,
      ),
    );
  }
}

class _MockupImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double aspectRatio;

  const _MockupImage({
    required this.imagePath,
    required this.width,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
