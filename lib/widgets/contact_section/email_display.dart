part of '../../sections/contact_section.dart';

class _EmailDisplay extends StatelessWidget {
  final ThemeData theme;
  final TextAlign textAlign;

  const _EmailDisplay({required this.theme, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    const email = 'djehelmohamedsalah@gmail.com';
    return GestureDetector(
      onTap: () => launchUrl(Uri(scheme: 'mailto', path: email)),
      child: SelectableText(
        email,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
