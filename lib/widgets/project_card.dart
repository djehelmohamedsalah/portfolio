import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String logo;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.logo,
    this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          constraints: const BoxConstraints(maxWidth: 350),
          padding: const EdgeInsets.all(20),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0, -5, 0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(
                  alpha: _isHovered ? 0.3 : 0.2,
                ),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 10 : 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.logo, width: 120, height: 120),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
