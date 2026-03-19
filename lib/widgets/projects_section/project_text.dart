import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/hover_outline_buttton.dart';
import '../../sections/project_details_page.dart';
import '../../utils/responsive_layout.dart';
import 'project_config.dart';

class ProjectText extends StatelessWidget {
  final ProjectConfig config;

  const ProjectText({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.layout.isMobile;
    final titleSize = isMobile ? 36.0 : 52.0;
    final bodySize = isMobile ? 15.5 : 17.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            config.project.title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontSize: titleSize,
              height: 1.18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Divider(
          color: Colors.white,
          thickness: 1,
          indent: 0,
          endIndent: 200,
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            config.project.overview,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: bodySize,
              height: 1.65,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
