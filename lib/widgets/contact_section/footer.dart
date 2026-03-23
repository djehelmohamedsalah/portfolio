part of '../../sections/contact_section.dart';

class _Footer extends StatelessWidget {
  final ThemeData theme;
  final AppLayout layout;

  const _Footer({required this.theme, required this.layout});

  @override
  Widget build(BuildContext context) {
    // Responsive footer font size
    final fontSize = layout.isDesktop
        ? 16.0
        : layout.isTablet
            ? 14.0
            : 12.0;

    final spacing = layout.isMobile ? 10.0 : 16.0;

    return Column(
      children: [
        Text(
          AppStrings.footerText,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            letterSpacing: 0.4,
            fontSize: fontSize,
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: spacing),
        Text(
          AppStrings.rightText,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            letterSpacing: 0.4,
            fontSize: fontSize,
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
