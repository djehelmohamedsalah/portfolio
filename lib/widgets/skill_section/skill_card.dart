import 'package:flutter/material.dart';
import '../../core/utils/app_layout.dart';
import 'skill_category.dart';
import 'skill_column.dart';
import 'skill_section_theme.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({super.key, required this.category, required this.layout});

  final SkillCategory category;
  final AppLayout layout;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = SkillSectionTheme.of(context);
    final enableHover = widget.layout.isDesktop;
    final scale = enableHover && _hover ? 1.03 : 1.0;

    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      transform: Matrix4.diagonal3Values(scale, scale, 1.0),
      transformAlignment: Alignment.center,
      padding: EdgeInsets.all(widget.layout.itemSpacing * 1.5),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.3),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.25),
          width: 1,
        ),
        borderRadius: theme.cardRadius,
      ),
      child: SkillColumn(category: widget.category, layout: widget.layout),
    );

    if (!enableHover) return card;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: card,
    );
  }
}
