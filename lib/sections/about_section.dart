import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionContainer(
      key: sectionKey,
      title: AppStrings.aboutTitle,
      color: theme.colorScheme.surface.withValues(alpha: 0.35),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(alignment: Alignment.center, child: _AboutImage()),
            const SizedBox(width: 40),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.aboutDescription,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.8),
                ),
              ),
            ),
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
    final borderRadius = BorderRadius.circular(20);

    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: borderRadius,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          'lib/assets/photos/developper/3D_Avatar.jpg',
          fit: BoxFit.cover,
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
