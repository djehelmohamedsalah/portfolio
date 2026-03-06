part of '../../sections/contact_section.dart';

class _SocialLink {
  final String label;
  final String assetPath;
  final String url;
  final bool tintWithTheme;

  const _SocialLink({
    required this.label,
    required this.assetPath,
    required this.url,
    this.tintWithTheme = false,
  });
}
