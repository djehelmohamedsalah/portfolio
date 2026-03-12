part of '../../sections/contact_section.dart';

class _EmailDisplay extends StatelessWidget {
  final ThemeData theme;
  final TextAlign textAlign;

  const _EmailDisplay({required this.theme, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    const email = 'djehelmohamedsalah@gmail.com';
    final alignment = switch (textAlign) {
      TextAlign.right => Alignment.centerRight,
      TextAlign.left => Alignment.centerLeft,
      _ => Alignment.center,
    };

    return Align(
      alignment: alignment,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => launchUrl(Uri(scheme: 'mailto', path: email)),
            child: SelectableText(
              email,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 0.4,
              ),
              textAlign: textAlign,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            iconSize: 20,
            tooltip: 'Copy email',
            onPressed: () async {
              await Clipboard.setData(const ClipboardData(text: email));
              final messenger = ScaffoldMessenger.maybeOf(context);
              messenger?.showSnackBar(
                const SnackBar(
                  content: Text(AppStrings.emailCopied),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.copy_rounded),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
