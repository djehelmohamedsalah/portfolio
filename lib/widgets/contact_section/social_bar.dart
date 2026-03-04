part of '../../sections/contact_section.dart';

class _SocialBar extends StatelessWidget {
  final ThemeData theme;

  const _SocialBar({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 32,
      runSpacing: 16,
      children: ContactSection._socials
          .map(
            (link) => _HoverIconButton(
              assetPath: link.assetPath,
              label: link.label,
              onTap: () => _launchUrl(link.url),
            ),
          )
          .toList(),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
