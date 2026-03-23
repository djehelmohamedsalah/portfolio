part of '../../sections/contact_section.dart';

class _SocialBar extends StatelessWidget {
  final ThemeData theme;
  final AppLayout layout;

  const _SocialBar({required this.theme, required this.layout});

  @override
  Widget build(BuildContext context) {
    // Responsive icon size and spacing
    final iconSize = layout.isDesktop
        ? 28.0
        : layout.isTablet
            ? 24.0
            : 22.0;

    final iconPadding = layout.isDesktop
        ? 12.0
        : layout.isTablet
            ? 8.0
            : 6.0;

    final spacing = layout.isDesktop
        ? 32.0
        : layout.isTablet
            ? 16.0
            : 8.0;

    final icons = ContactSection._socials
        .map(
          (link) => HoverIconButton(
            assetPath: link.assetPath,
            label: link.label,
            tintWithTheme: link.tintWithTheme,
            onTap: () => _launchUrl(link.url),
            size: iconSize,
            padding: iconPadding,
          ),
        )
        .toList();

    // Build a single-line Row with controlled spacing between icons
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < icons.length; i++) ...[
          if (i > 0) SizedBox(width: spacing),
          icons[i],
        ],
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
