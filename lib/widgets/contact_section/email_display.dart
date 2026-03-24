part of '../../sections/contact_section.dart';

class _EmailDisplay extends StatelessWidget {
  final ThemeData theme;
  final TextAlign textAlign;
  final AppLayout layout;

  const _EmailDisplay({
    required this.theme,
    this.textAlign = TextAlign.center,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    const email = 'djehelmohamedsalah@gmail.com';
    final alignment = switch (textAlign) {
      TextAlign.right => Alignment.centerRight,
      TextAlign.left => Alignment.centerLeft,
      _ => Alignment.center,
    };

    // Responsive font size
    final emailFontSize = layout.isDesktop
        ? 20.0
        : layout.isTablet
        ? 17.0
        : 14.0;

    final iconSize = layout.isMobile ? 18.0 : 20.0;

    return Align(
      alignment: alignment,
      child: layout.isMobile
          ? // On mobile: stack email and copy button vertically if needed
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => launchUrl(Uri(scheme: 'mailto', path: email)),
                  child: SelectableText(
                    email,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: emailFontSize,
                      letterSpacing: 0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                _CopyButton(iconSize: iconSize),
              ],
            )
          : // Desktop and Tablet: keep row layout
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri(scheme: 'mailto', path: email)),
                    child: SelectableText(
                      email,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: emailFontSize,
                        letterSpacing: 0.4,
                      ),
                      textAlign: textAlign,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _CopyButton(iconSize: iconSize),
              ],
            ),
    );
  }
}

class _CopyButton extends StatelessWidget {
  final double iconSize;

  const _CopyButton({required this.iconSize});

  @override
  Widget build(BuildContext context) {
    const email = 'djehelmohamedsalah@gmail.com';

    return IconButton(
      iconSize: iconSize,
      tooltip: 'Copy email',
      onPressed: () async {
        final messenger = ScaffoldMessenger.maybeOf(context);
        await Clipboard.setData(const ClipboardData(text: email));
        if (!context.mounted) return;
        final strings = Provider.of<StringsProvider>(context, listen: false).strings;
        messenger?.showSnackBar(
          SnackBar(
            content: Text(strings.emailCopied),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      icon: const Icon(Icons.copy_rounded),
      visualDensity: VisualDensity.compact,
    );
  }
}
