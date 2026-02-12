import 'package:flutter/material.dart';
import '../../utils/responsive_layout.dart';
import 'project_background.dart';
import 'project_config.dart';
import 'project_text.dart';
import 'project_visual.dart';

class ProjectSection extends StatelessWidget {
  final ProjectConfig config;

  const ProjectSection({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = ResponsiveLayout.isMobile(context);
    final minHeight = isMobile ? size.height * 0.75 : size.height * 0.92;
    final verticalPadding = isMobile ? 56.0 : 96.0;
    final horizontalPadding = _horizontalPadding(size.width);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      child: Stack(
        children: [
          Positioned.fill(child: ProjectBackground(config: config)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 900) {
                  return _MobileCaseStudyLayout(config: config);
                }
                return _DesktopCaseStudyLayout(
                  config: config,
                  maxWidth: constraints.maxWidth,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double _horizontalPadding(double width) {
    if (width >= 1440) return 120;
    if (width >= 1100) return 100;
    if (width >= 900) return 80;
    if (width >= 700) return 48;
    return 24;
  }
}

class _DesktopCaseStudyLayout extends StatelessWidget {
  final ProjectConfig config;
  final double maxWidth;

  const _DesktopCaseStudyLayout({required this.config, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final leftWidth = maxWidth * 0.46;
    final rightWidth = maxWidth * 0.54;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: leftWidth,
          child: ProjectText(config: config),
        ),
        SizedBox(
          width: rightWidth,
          child: Align(
            alignment: Alignment.centerRight,
            child: ProjectVisual(project: config.project),
          ),
        ),
      ],
    );
  }
}

class _MobileCaseStudyLayout extends StatelessWidget {
  final ProjectConfig config;

  const _MobileCaseStudyLayout({required this.config});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectText(config: config),
        const SizedBox(height: 48),
        Center(child: ProjectVisual(project: config.project)),
      ],
    );
  }
}
