import 'package:flutter/material.dart';
import '../../utils/app_layout.dart';
import 'skill_category.dart';
import 'skill_section_theme.dart';

class SkillColumn extends StatelessWidget {
  const SkillColumn({super.key, required this.category, required this.layout});

  final SkillCategory category;
  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    final theme = SkillSectionTheme.of(context);
    final primary = theme.colorScheme.primary;
    final subtleIconBg = theme.subtleIconBackground(primary);
    final isDesktop = layout.isDesktop;
    final isMobile = layout.isMobile;

    return Align(
      alignment: isDesktop ? Alignment.topLeft : Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isDesktop
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: isDesktop
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: subtleIconBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(category.icon, color: primary, size: 18),
              ),
              SizedBox(width: layout.itemSpacing),
              Flexible(
                child: SelectableText(
                  category.title,
                  textAlign: TextAlign.start,
                  // softWrap: true
                  style: isMobile
                      ? theme.titleStyle(layout)!.copyWith(fontSize: 15)
                      : theme.titleStyle(layout),
                ),
              ),
            ],
          ),
          SizedBox(height: layout.itemSpacing),
          ...category.skills.map(
            (skill) => Padding(
              padding: EdgeInsets.only(bottom: layout.itemSpacing),
              child: SelectableText(
                skill,
                textAlign: isDesktop ? TextAlign.start : TextAlign.center,
                style: isMobile
                    ? theme.bodyStyle(layout)!.copyWith(fontSize: 13)
                    : theme.bodyStyle(layout),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
