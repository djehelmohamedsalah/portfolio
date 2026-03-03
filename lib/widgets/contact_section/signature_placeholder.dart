part of '../../sections/contact_section.dart';

class _SignaturePlaceholder extends StatelessWidget {
  final ThemeData theme;
  const _SignaturePlaceholder({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '-- Signature --',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white70,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Container(width: 120, height: 2, color: Colors.white24),
        ],
      ),
    );
  }
}
