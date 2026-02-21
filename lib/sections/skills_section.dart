import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
import '../widgets/skill_chip.dart';
import '../constants/app_strings.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      color: Theme.of(context).colorScheme.surface,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: AppStrings.skillsTitle, centered: false),
          const SizedBox(height: 40),
          Text(
            AppStrings.techStack,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              SkillChip(label: AppStrings.skillFlutter),
              SkillChip(label: AppStrings.skillDart),
              SkillChip(label: AppStrings.skillFirebase),
              SkillChip(label: AppStrings.skillRestApi),
              SkillChip(label: AppStrings.skillUiUx),
              SkillChip(label: AppStrings.skillGit),
              SkillChip(label: AppStrings.skillStateManagement),
            ],
          ),
        ],
      ),
    );
  }
}
