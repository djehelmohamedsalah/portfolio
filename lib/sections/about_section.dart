import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/section_container.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SectionContainer(
      key: sectionKey,
      color: theme.colorScheme.surface.withValues(alpha: 0.35),
      height: 600,
      child: Column(
        children: [
          _buildAboutTitle(context),
          const SizedBox(height: 28),
          ResponsiveLayout(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.aboutDescription.trim(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.8),
                ),
                const SizedBox(height: 26),
                _buildAboutActions(context),
                const SizedBox(height: 40),
                const Center(child: _AboutImage()),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _AboutImage(),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.aboutDescription.trim(),
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(height: 1.8),
                      ),
                      const SizedBox(height: 26),
                      _buildAboutActions(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTitle(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final theme = Theme.of(context);
    return Text(
      AppStrings.aboutTitle,
      style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: isMobile ? 28 : 34,
            color: theme.textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w800,
          ) ??
          TextStyle(
            fontSize: isMobile ? 28 : 34,
            color: theme.textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w800,
          ),
    );
  }

  Widget _buildAboutActions(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    final theme = Theme.of(context);
    final double buttonTextSize = isMobile ? 15 : 16;
    final ButtonStyle ctaButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
      minimumSize: const Size(180, 56),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: TextStyle(
        fontSize: buttonTextSize,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    ).copyWith(elevation: const WidgetStatePropertyAll(2));

    return Wrap(
      spacing: 20,
      runSpacing: 12,
      children: [
        SizedBox(
          width: 180,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _openExternalLink(context, AppStrings.resumeUrl),
            style: ctaButtonStyle,
            child: const Text(AppStrings.resumeButton),
          ),
        ),
        SizedBox(
          width: 180,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _openExternalLink(context, AppStrings.linkedInUrl),
            style: ctaButtonStyle,
            child: const Text(AppStrings.linkedInButton),
          ),
        ),
      ],
    );
  }

  Future<void> _openExternalLink(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Unable to open link.')));
  }
}

class _AboutImage extends StatelessWidget {
  const _AboutImage();

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: borderRadius,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Image.asset(
          'lib/assets/photos/developper/3D_Avatar.jpg',
          fit: BoxFit.cover,
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
