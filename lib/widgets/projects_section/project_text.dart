import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/general_widgets/hover_outline_buttton.dart';
import '../../sections/project_details_page.dart';
import '../../utils/responsive_layout.dart';
import 'project_config.dart';

class ProjectText extends StatelessWidget {
  final ProjectConfig config;
  final bool showButton;

  const ProjectText({super.key, required this.config, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final isDesktop = layout.isDesktop;
    final textAlign = isDesktop ? TextAlign.start : TextAlign.center;
    final columnAlignment = isDesktop
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    double scaleSize(double min, double max) {
      final width = layout.width.clamp(360, 1400);
      final t = (width - 360) / (1400 - 360);
      return min + (max - min) * t;
    }

    final titleSize = scaleSize(24, 54);
    final bodySize = scaleSize(12, 18);
    final logoSize = scaleSize(48, 70);
    final overviewMaxWidth = scaleSize(420, 640);
    final overviewLineHeight =
        1.5 + (0.2 * ((layout.width.clamp(360, 1400) - 360) / (1400 - 360)));

    final detailsButton = HoverOutlineButton(
      label: AppStrings.moreDetailsLabel,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailsPage(project: config.project),
          ),
        );
      },
    );

    return Column(
      crossAxisAlignment: columnAlignment,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: isDesktop
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Container(
              width: logoSize,
              height: logoSize,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                  width: 1,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(config.project.logo, fit: BoxFit.contain),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: SelectableText(
                  config.project.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontSize: titleSize,
                    height: 1.18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: textAlign,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        if (isDesktop)
          const Divider(
            color: Colors.white,
            thickness: 1,
            indent: 0,
            endIndent: 200,
          ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: overviewMaxWidth),
          child: SelectableText(
            config.project.overview,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: bodySize,
              height: overviewLineHeight,
              fontWeight: FontWeight.w600,
            ),
            textAlign: textAlign,
          ),
        ),

        const SizedBox(height: 32),
        if (showButton) detailsButton,
      ],
    );
  }
}
