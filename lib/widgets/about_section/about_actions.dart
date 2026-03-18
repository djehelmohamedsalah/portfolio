import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/app_strings.dart';
import 'about_primary_button.dart';

class AboutActions extends StatelessWidget {
  const AboutActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 12,
      children: const [
        _ActionButton(label: AppStrings.resumeButton, url: AppStrings.resumeUrl),
        _ActionButton(label: AppStrings.linkedInButton, url: AppStrings.linkedInUrl),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.label, required this.url});

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 56,
      child: AboutPrimaryButton(
        label: label,
        onTap: () => _openExternalLink(context, url),
      ),
    );
  }

  Future<void> _openExternalLink(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppStrings.externallinksnackbarmessag)),
    );
  }
}
