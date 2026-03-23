import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:mo_salah_dev/constants/app_strings.dart";
import "package:url_launcher/url_launcher.dart";
import "../utils/app_layout.dart";

part '../widgets/contact_section/footer.dart';
part '../widgets/contact_section/signature_placeholder.dart';
part '../widgets/contact_section/social_bar.dart';
part '../widgets/contact_section/email_display.dart';
part '../widgets/contact_section/nav_link.dart';
part '../widgets/contact_section/hover_icon_button.dart';
part '../widgets/contact_section/social_link.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ContactSection({super.key, required this.sectionKey});

  static const _maxWidth = 1200.0;
  static const _socials = [
    _SocialLink(
      label: 'GitHub',
      assetPath: 'lib/assets/photos/social_icons/github.svg',
      url: 'https://github.com/djehelmohamedsalah',
      tintWithTheme: true,
    ),
    _SocialLink(
      label: 'Watsapp',
      assetPath: 'lib/assets/photos/social_icons/whatsapp.svg',
      url: 'https://wa.me/213655663020',
    ),
    _SocialLink(
      label: 'LinkedIn',
      assetPath: 'lib/assets/photos/social_icons/linkedin.svg',
      url: 'https://www.linkedin.com/in/mohamedsalahdjehel/',
    ),
    _SocialLink(
      label: 'Instagram',
      assetPath: 'lib/assets/photos/social_icons/instagram.svg',
      url: 'https://www.instagram.com/moh.medsalah/',
    ),
    _SocialLink(
      label: 'Facebook',
      assetPath: 'lib/assets/photos/social_icons/facebook.svg',
      url: 'https://facebook.com/mohamedsalah.djehel.9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: theme.colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final layout = AppLayout.fromWidth(constraints.maxWidth);

              // Responsive padding
              final hPadding = layout.isDesktop
                  ? 24.0
                  : layout.isTablet
                  ? 20.0
                  : 16.0;
              final vPadding = layout.isDesktop
                  ? 64.0
                  : layout.isTablet
                  ? 48.0
                  : 36.0;

              // Responsive spacing between sections
              final sectionGap = layout.isDesktop
                  ? 36.0
                  : layout.isTablet
                  ? 28.0
                  : 24.0;

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: hPadding,
                  vertical: vPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _TopRow(layout: layout),
                    SizedBox(height: sectionGap),
                    _SocialRow(theme: theme, layout: layout),
                    SizedBox(height: sectionGap),
                    _Footer(theme: theme, layout: layout),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  final AppLayout layout;

  const _TopRow({required this.layout});

  @override
  Widget build(BuildContext context) {
    if (!layout.isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _HeadlineBlock(textAlign: TextAlign.center, layout: layout),
          SizedBox(height: layout.isMobile ? 20 : 28),
          _SignatureBlock(alignment: Alignment.center, layout: layout),
        ],
      );
    }

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _HeadlineBlock(textAlign: TextAlign.left, layout: layout),
          const SizedBox(width: 200),
          _SignatureBlock(alignment: Alignment.centerLeft, layout: layout),
          const SizedBox(width: 50),
        ],
      ),
    );
  }
}

class _HeadlineBlock extends StatelessWidget {
  final TextAlign textAlign;
  final AppLayout layout;

  const _HeadlineBlock({required this.textAlign, required this.layout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Responsive font size
    final fontSize = layout.isDesktop
        ? 26.0
        : layout.isTablet
        ? 22.0
        : 19.0;

    return Align(
      alignment: textAlign == TextAlign.left
          ? Alignment.centerLeft
          : Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: layout.isMobile ? double.infinity : 450,
        ),
        child: SelectableText(
          AppStrings.interestedInWorking,
          textAlign: textAlign,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

class _SignatureBlock extends StatelessWidget {
  final Alignment alignment;
  final AppLayout layout;

  const _SignatureBlock({required this.alignment, required this.layout});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: _SignaturePlaceholder(theme: Theme.of(context), layout: layout),
    );
  }
}

class _SocialRow extends StatelessWidget {
  final ThemeData theme;
  final AppLayout layout;

  const _SocialRow({required this.theme, required this.layout});

  @override
  Widget build(BuildContext context) {
    if (!layout.isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SocialBar(theme: theme, layout: layout),
          SizedBox(height: layout.isMobile ? 16 : 20),
          _EmailDisplay(
            theme: theme,
            textAlign: TextAlign.center,
            layout: layout,
          ),
        ],
      );
    }

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SocialBar(theme: theme, layout: layout),
          const SizedBox(width: 100),
          _EmailDisplay(
            theme: theme,
            textAlign: TextAlign.right,
            layout: layout,
          ),
        ],
      ),
    );
  }
}
