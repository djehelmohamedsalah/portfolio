import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      title: AppStrings.aboutTitle,
      color: Colors.transparent,
      height: 600,
      child: ResponsiveLayout(
        mobile: Column(
          children: [
            Text(
              AppStrings.aboutDescription,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.8),
            ),
            const SizedBox(height: 40),
            Center(child: _AboutImage()),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.aboutDescription,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(height: 1.8),
              ),
            ),
            const SizedBox(width: 40),
            const _AboutImage(),
          ],
        ),
      ),
    );
  }
}

class _AboutImage extends StatelessWidget {
  const _AboutImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Icon(
        Icons.person,
        size: 100,
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
      ),
    );
  }
}
