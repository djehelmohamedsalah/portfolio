part of '../../sections/project_details_page.dart';

class _OverviewSection extends StatelessWidget {
  final Project project;

  const _OverviewSection({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Overview'),
        const SizedBox(height: 15),
        Text(
          project.overview,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
              ),
        ),
        const SizedBox(height: 30),
        const _SectionTitle('Challenges & Solutions'),
        const SizedBox(height: 15),
        Text(
          project.challenges,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
              ),
        ),
        const SizedBox(height: 30),
        const _SectionTitle('Tech Stack'),
        const SizedBox(height: 15),
        Text(
          project.techStack,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
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
