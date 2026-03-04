import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:url_launcher/url_launcher.dart";

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
      assetPath: 'lib/assets/photos/social_icons/github-icon-1.svg',
      url: 'https://github.com',
    ),
    _SocialLink(
      label: 'LinkedIn',
      assetPath: 'lib/assets/photos/social_icons/linkedin-icon-2.svg',
      url: 'https://www.linkedin.com',
    ),
    _SocialLink(
      label: 'Instagram',
      assetPath: 'lib/assets/photos/social_icons/instagram-2016-5.svg',
      url: 'https://www.instagram.com',
    ),
    _SocialLink(
      label: 'Facebook',
      assetPath: 'lib/assets/photos/social_icons/facebook-3-2.svg',
      url: 'https://www.facebook.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 960;
              final isTablet = constraints.maxWidth >= 720 && !isDesktop;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _TopRow(isDesktop: isDesktop),
                  SizedBox(
                    height: isDesktop
                        ? 64
                        : isTablet
                        ? 48
                        : 48,
                  ),
                  _SocialRow(theme: theme, isDesktop: isDesktop),
                  SizedBox(height: isDesktop ? 48 : 32),
                  const _FooterNav(),
                  const SizedBox(height: 24),
                  _Footer(theme: theme),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  final bool isDesktop;

  const _TopRow({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _HeadlineBlock(textAlign: TextAlign.center),
          SizedBox(height: 32),
          _SignatureBlock(alignment: Alignment.center),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(child: _HeadlineBlock(textAlign: TextAlign.left)),
        SizedBox(width: 48),
        Expanded(child: _SignatureBlock(alignment: Alignment.centerRight)),
      ],
    );
  }
}

class _HeadlineBlock extends StatelessWidget {
  final TextAlign textAlign;

  const _HeadlineBlock({required this.textAlign});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: textAlign == TextAlign.left
          ? Alignment.centerLeft
          : Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Text(
          "Let's build something great together.\nI'm open to opportunities and collaborations.",
          textAlign: textAlign,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

class _SignatureBlock extends StatelessWidget {
  final Alignment alignment;

  const _SignatureBlock({required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: _SignaturePlaceholder(theme: Theme.of(context)),
    );
  }
}

class _SocialRow extends StatelessWidget {
  final ThemeData theme;
  final bool isDesktop;

  const _SocialRow({required this.theme, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _SocialBar(theme: theme),
          const SizedBox(height: 24),
          _EmailDisplay(theme: theme, textAlign: TextAlign.center),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: _SocialBar(theme: theme),
          ),
        ),
        const SizedBox(width: 48),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: _EmailDisplay(theme: theme, textAlign: TextAlign.right),
          ),
        ),
      ],
    );
  }
}

class _FooterNav extends StatelessWidget {
  const _FooterNav();

  @override
  Widget build(BuildContext context) {
    const items = ['About', 'Projects', 'Experience', 'Contact'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 16,
          children: items
              .map((label) => _NavLink(label: label, targetKey: null))
              .toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
