import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      title: "Skills",
      color: Theme.of(context).colorScheme.surface,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tech Stack", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              SkillChip(label: "Flutter"),
              SkillChip(label: "Dart"),
              SkillChip(label: "Firebase"),
              SkillChip(label: "Rest API"),
              SkillChip(label: "UI/UX Design"),
              SkillChip(label: "Git & GitHub"),
              SkillChip(label: "State Management"),
            ],
          ),
        ],
      ),
    );
  }
}
