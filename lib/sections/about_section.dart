import 'package:flutter/material.dart';
import '../widgets/section_container.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      title: "About Me",
      color: Colors.transparent,
      height: 600,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "I am a passionate Flutter developer with a knack for creating beautiful and functional web and mobile applications.\n\n"
              "I specialize in building responsive, user-friendly interfaces without relying on heavy external libraries. "
              "My goal is to deliver clean code and exceptional user experiences.",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.8),
            ),
          ),
          const SizedBox(width: 40),
          // Placeholder for an image or graphic
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Icon(
              Icons.person,
              size: 100,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
