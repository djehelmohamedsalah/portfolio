import 'package:flutter/material.dart';
import '../../sections/project_details_page.dart';
import '../../utils/responsive_layout.dart';
import 'project_config.dart';

class ProjectText extends StatelessWidget {
  final ProjectConfig config;

  const ProjectText({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
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
            ),
          ),
        ),
        const SizedBox(height: 32),
        HoverOutlineButton(
          label: 'more details',
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

class HoverOutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const HoverOutlineButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<HoverOutlineButton> createState() => _HoverOutlineButtonState();
}

class _HoverOutlineButtonState extends State<HoverOutlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final background = _hovering ? Colors.white : Colors.transparent;
    final foreground = _hovering ? Colors.black : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(999),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
