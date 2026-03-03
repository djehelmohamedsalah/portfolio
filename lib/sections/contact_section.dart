import "package:flutter/material.dart";
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
      icon: Icons.code_rounded,
      url: 'https://github.com',
    ),
    _SocialLink(
      label: 'LinkedIn',
      icon: Icons.business_center_outlined,
      url: 'https://www.linkedin.com',
    ),
    _SocialLink(
      label: 'Gmail',
      icon: Icons.mail_outline_rounded,
      url: 'mailto:djehelmohamedsalah@gmail.com',
    ),
    _SocialLink(
      label: 'Portfolio',
      icon: Icons.public_rounded,
      url: 'https://your-portfolio-url.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      key: sectionKey,
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isDesktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildHeadline(theme)),
                        const SizedBox(width: 40),
                        _SignaturePlaceholder(theme: theme),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildHeadline(theme, textAlign: TextAlign.center),
                        const SizedBox(height: 32),
                        _SignaturePlaceholder(theme: theme),
                      ],
                    ),
                  const SizedBox(height: 64),
                  _SocialBar(theme: theme),
                  const SizedBox(height: 36),
                  _EmailDisplay(theme: theme),
                  const SizedBox(height: 28),
                  _Footer(theme: theme),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeadline(
    ThemeData theme, {
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      "Let's build something great together.\nI'm open to opportunities and collaborations.",
      textAlign: textAlign,
      style: theme.textTheme.headlineMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
    );
  }
}
