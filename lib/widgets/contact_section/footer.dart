part of '../../sections/contact_section.dart';

class _Footer extends StatelessWidget {
  final ThemeData theme;

  const _Footer({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Mohamed Salah Djehel · Portfolio · Mobile Applications Developer',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            letterSpacing: 0.4,
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '© 2026 · All rights reserved',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            letterSpacing: 0.4,
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
