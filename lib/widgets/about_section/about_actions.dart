import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_primary_button.dart';

class AboutActions extends StatelessWidget {
  const AboutActions({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<StringsProvider>().strings;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _ActionButton(
            label: strings.resumeButton,
            url: strings.resumeUrl,
            isMobile: true,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _ActionButton(
            label: strings.linkedInButton,
            url: strings.linkedInUrl,
            isMobile: true,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.url,
    this.isMobile = false,
  });

  final String label;
  final String url;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry? padding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
        : null;

    return SizedBox(
      height: isMobile ? 48 : 56,
      child: AboutPrimaryButton(
        label: label,
        padding: padding,
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
    final strings = Provider.of<StringsProvider>(context, listen: false).strings;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(strings.externallinksnackbarmessag)),
    );
  }
}
