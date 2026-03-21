import 'package:flutter/material.dart';
import '../../utils/responsive_extensions.dart';
import 'about_section_theme.dart';

class AboutImage extends StatefulWidget {
  const AboutImage({super.key});

  @override
  State<AboutImage> createState() => _AboutImageState();
}

class _AboutImageState extends State<AboutImage>
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
    final theme = AboutSectionTheme.of(context);
    final borderRadius = theme.cardRadius;

    final bool isDesktop = context.isDesktop;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: theme.theme.colorScheme.surface,
            borderRadius: borderRadius,
            border: Border.all(color: theme.avatarBorderColor),
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final avatarSize = constraints.maxWidth;
                final capsuleWidth = avatarSize * 0.22;
                final shadowWidth = capsuleWidth * 0.82;

                final baseImage = isDesktop
                    ? 'lib/assets/photos/developper/avatar.png'
                    : 'lib/assets/photos/developper/avatar_with_cappsulle.jpg';

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Image.asset(baseImage, fit: BoxFit.cover),
                    ),
                    if (isDesktop) ...[
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
                                  color: theme.capsuleShadowColor,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.capsuleShadowBlurColor,
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
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: -3,
                                        blurRadius: 20,
                                        offset: Offset(0, 2),
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
