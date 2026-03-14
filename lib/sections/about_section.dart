import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/section_container.dart';
import '../widgets/section_header.dart';
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
      titleCentered: true,
      child: Column(
        children: [
          SectionHeader(
            title: AppStrings.aboutTitle,
            subtitle: AppStrings.aboutSubTitle,
          ),
          const SizedBox(height: 48),
          ResponsiveLayout(
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.aboutDescription.trim(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.8),
                  textAlign: TextAlign.center,
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.8,
                          fontWeight: FontWeight.w600,
                        ),
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

  Widget _buildAboutActions(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 12,
      children: [
        SizedBox(
          width: 180,
          height: 56,
          child: _PrimaryHoverOutlineButton(
            label: AppStrings.resumeButton,
            onTap: () => _openExternalLink(context, AppStrings.resumeUrl),
          ),
        ),
        SizedBox(
          width: 180,
          height: 56,
          child: _PrimaryHoverOutlineButton(
            label: AppStrings.linkedInButton,
            onTap: () => _openExternalLink(context, AppStrings.linkedInUrl),
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(AppStrings.externallinksnackbarmessag)),
    );
  }
}

class _PrimaryHoverOutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryHoverOutlineButton({required this.label, required this.onTap});

  @override
  State<_PrimaryHoverOutlineButton> createState() =>
      _PrimaryHoverOutlineButtonState();
}

class _PrimaryHoverOutlineButtonState
    extends State<_PrimaryHoverOutlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onTertiary = theme.colorScheme.onTertiary;
    final onPrimary = theme.colorScheme.onPrimary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          decoration: BoxDecoration(
            color: _hovering ? onTertiary : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: onTertiary, width: 1.5),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
                color: _hovering ? onPrimary : onTertiary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AboutImage extends StatefulWidget {
  const _AboutImage();

  @override
  State<_AboutImage> createState() => _AboutImageState();
}

class _AboutImageState extends State<_AboutImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _float;

  static const Alignment _capsuleAlignment = Alignment(-9, -2.5);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);
    _float = Tween<double>(
      begin: -20,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: borderRadius,
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.3),
            ),
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final avatarSize = constraints.maxWidth;
                final capsuleWidth = avatarSize * 0.22;
                final shadowWidth = capsuleWidth * 0.82;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'lib/assets/photos/developper/avatar2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _float,
                      builder: (context, child) {
                        final double shadowYOffset = _float.value * 0.35;
                        return Align(
                          alignment: _capsuleAlignment,
                          child: Transform.translate(
                            offset: Offset(0, shadowYOffset),
                            child: Container(
                              width: shadowWidth,
                              height: shadowWidth * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.18),
                                    blurRadius: 12,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _float,
                      builder: (context, child) {
                        return SizedBox(
                          height: 120,
                          width: 120,
                          child: Align(
                            alignment: _capsuleAlignment,
                            child: Transform.translate(
                              offset: Offset(0, _float.value),
                              child: Container(
                                width: capsuleWidth,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.12,
                                      ),
                                      blurRadius: 14,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'lib/assets/photos/developper/cappsulle.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
