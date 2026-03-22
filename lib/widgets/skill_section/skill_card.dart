import 'package:flutter/material.dart';
import '../../utils/app_layout.dart';
import 'skill_category.dart';
import 'skill_column.dart';
import 'skill_section_theme.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.category,
    required this.layout,
  });

  final SkillCategory category;
  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    final theme = SkillSectionTheme.of(context);

    return Container(
      padding: EdgeInsets.all(layout.itemSpacing * 1.5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: theme.dividerColor, width: 1),
        borderRadius: theme.cardRadius,
      ),
      child: SkillColumn(category: category, layout: layout),
    );
  }
}
