part of '../../sections/project_details_page.dart';

class _OverviewSection extends StatelessWidget {
  final Project project;

  const _OverviewSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final bodySize = scaleForLayout(context, 15, 18);
    final lineHeight = 1.45 + (0.2 *
        ((context.layout.width.clamp(360.0, 1400.0) - 360.0) / (1400.0 - 360.0)));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle(AppStrings.overviewTitle),
        const SizedBox(height: 15),
        Text(
          project.overview,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: lineHeight,
                fontSize: bodySize,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
              ),
        ),
        const SizedBox(height: 30),
        const _SectionTitle(AppStrings.chalengesTitel),
        const SizedBox(height: 15),
        Text(
          project.challenges,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: lineHeight,
                fontSize: bodySize,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
              ),
        ),
        const SizedBox(height: 30),
        const _SectionTitle(AppStrings.techStackTitle),
        const SizedBox(height: 15),
        Text(
          project.techStack,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: lineHeight,
                fontSize: bodySize,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
              ),
        ),
      ],
    );
  }
}
