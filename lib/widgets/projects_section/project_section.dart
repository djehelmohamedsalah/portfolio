import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/sections/project_details_page.dart';
import 'package:mo_salah_dev/widgets/general_widgets/hover_outline_buttton.dart';
import '../../utils/responsive_layout.dart';
import '../../utils/app_layout.dart';
import 'project_background.dart';
import 'project_config.dart';
import 'project_text.dart';
import 'project_visual.dart';

class ProjectSection extends StatelessWidget {
  final ProjectConfig config;

  const ProjectSection({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      builder: (context, layout) {
        final minHeight = layout.isMobile ? 520.0 : 620.0;
        final verticalPadding = layout.isMobile ? 26.0 : 56.0;
        final horizontalPadding = layout.isDesktop
            ? layout.horizontalPadding + 24
            : layout.horizontalPadding;

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
                    final layout = AppLayout.fromWidth(constraints.maxWidth);
                    if (!layout.isDesktop) {
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
      },
    );
  }
}

class _DesktopCaseStudyLayout extends StatelessWidget {
  final ProjectConfig config;
  final double maxWidth;

  const _DesktopCaseStudyLayout({required this.config, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final leftWidth = maxWidth * 0.70;
    final rightWidth = maxWidth * 0.30;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: leftWidth,
          child: ProjectText(config: config),
        ),
        Row(
          children: [
            SizedBox(
              width: rightWidth,
              child: Align(
                alignment: Alignment.centerRight,
                child: ProjectVisual(project: config.project),
              ),
            ),
          ],
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProjectText(config: config, showButton: false),
        const SizedBox(height: 32),
        Center(child: ProjectVisual(project: config.project)),
        const SizedBox(height: 32),
        HoverOutlineButton(
          label: AppStrings.moreDetailsLabel,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProjectDetailsPage(project: config.project),
              ),
            );
          },
        ),
      ],
    );
  }
}
