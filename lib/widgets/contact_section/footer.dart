part of '../../sections/contact_section.dart';

class _Footer extends StatelessWidget {
  final ThemeData theme;

  const _Footer({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '[Mohamed Salah Djehel] · Flutter Developer · Mobile Applications',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white70,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '© 2026 · All rights reserved',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white54,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}
