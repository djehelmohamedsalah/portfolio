part of '../../sections/project_details_page.dart';

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return RevealOnScroll(
      child: SelectableText(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
          fontSize: scaleForLayout(context, 18, 22),
        ),
      ),
    );
  }
}
