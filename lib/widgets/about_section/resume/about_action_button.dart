import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../about_section_theme.dart';
import 'resume_downloader.dart';

class AboutActionButton extends StatelessWidget {
  const AboutActionButton({
    super.key,
    required this.label,
    required this.primaryUrl,
    this.isMobile = false,
    this.showDownload = false,
  });

  final String label;
  final String primaryUrl;
  final bool isMobile;
  final bool showDownload;

  @override
  Widget build(BuildContext context) {
    final theme = AboutSectionTheme.of(context);
    final double height = isMobile ? 48 : 56;
    final EdgeInsets mainPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    final EdgeInsets iconPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 14, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height,
          width: double.infinity,
          child: showDownload
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _SegmentButton(
                        padding: mainPadding,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(18),
                          right: Radius.circular(0),
                        ),
                        showRightBorder: false,
                        theme: theme,
                        onTap: () => _openPrimary(context),
                        buildChild: (hovering) => Text(
                          label,
                          style: theme.buttonLabelStyle(hovering),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      color: theme.buttonBorder.withValues(alpha: 0.55),
                    ),
                    Expanded(
                      flex: 1,
                      child: _SegmentButton(
                        padding: iconPadding,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(0),
                          right: Radius.circular(18),
                        ),
                        showLeftBorder: false,
                        theme: theme,
                        onTap: () => _download(context),
                        buildChild: (hovering) => Icon(
                          Icons.download_rounded,
                          size: isMobile ? 20 : 22,
                          color: theme.buttonLabel(hovering),
                        ),
                      ),
                    ),
                  ],
                )
              : _SegmentButton(
                  padding: mainPadding,
                  borderRadius: BorderRadius.circular(18),
                  theme: theme,
                  onTap: () => _openPrimary(context),
                  buildChild: (hovering) =>
                      Text(label, style: theme.buttonLabelStyle(hovering)),
                ),
        ),
        if (showDownload) ...[
          SizedBox(height: isMobile ? 8 : 10),
          Text(
            'Last updated: March 2026',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _openPrimary(BuildContext context) async {
    final uri = _resolveUrl(primaryUrl);
    final success = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );

    if (!success && context.mounted) {
      _showFailure(context);
    }
  }

  Future<void> _download(BuildContext context) async {
    final success = await downloadResume(_resolveUrl(primaryUrl).toString());
    if (!success && context.mounted) {
      _showFailure(context);
    }
  }

  void _showFailure(BuildContext context) {
    final strings = Provider.of<StringsProvider>(
      context,
      listen: false,
    ).strings;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(strings.externallinksnackbarmessag)));
  }

  /// Ensures assets resolve correctly on web (absolute URL) and other platforms.
  Uri _resolveUrl(String url) {
    final uri = Uri.parse(url);
    if (kIsWeb && !uri.hasScheme) {
      return Uri.base.resolveUri(uri);
    }
    return uri;
  }
}

class _SegmentButton extends StatefulWidget {
  const _SegmentButton({
    required this.onTap,
    required this.borderRadius,
    required this.padding,
    required this.theme,
    required this.buildChild,
    this.showLeftBorder = true,
    this.showRightBorder = true,
  });

  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final AboutSectionTheme theme;
  final Widget Function(bool hovering) buildChild;
  final bool showLeftBorder;
  final bool showRightBorder;

  @override
  State<_SegmentButton> createState() => _SegmentButtonState();
}

class _SegmentButtonState extends State<_SegmentButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final BorderSide side = BorderSide(
      color: widget.theme.buttonBorder,
      width: 1.5,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _hovering
                ? widget.theme.buttonHoverBackground
                : Colors.transparent,
            borderRadius: widget.borderRadius,
            border: Border(
              top: side,
              bottom: side,
              left: widget.showLeftBorder ? side : BorderSide.none,
              right: widget.showRightBorder ? side : BorderSide.none,
            ),
          ),
          child: Center(child: widget.buildChild(_hovering)),
        ),
      ),
    );
  }
}
