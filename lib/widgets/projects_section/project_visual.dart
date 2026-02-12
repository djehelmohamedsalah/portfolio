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
    final screenshots = project.screenshots;
    final tabletImage = screenshots.isNotEmpty ? screenshots[0] : project.logo;
    final phoneImage = screenshots.length > 1 ? screenshots[1] : project.logo;
    final isMobile = ResponsiveLayout.isMobile(context);
    final tabletWidth = isMobile ? 300.0 : 460.0;
    final phoneWidth = isMobile ? 120.0 : 150.0;

    return SizedBox(
      width: tabletWidth + phoneWidth * 0.6,
      height: tabletWidth * 0.75,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: _MockupImage(
              imagePath: tabletImage,
              width: tabletWidth,
              aspectRatio: 4 / 3,
            ),
          ),
          Positioned(
            right: tabletWidth * 0.68,
            top: tabletWidth * 0.12,
            child: _MockupImage(
              imagePath: phoneImage,
              width: phoneWidth,
              aspectRatio: 9 / 19,
            ),
          ),
        ],
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
