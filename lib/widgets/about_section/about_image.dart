import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/effects/tilt_3d.dart';
import 'package:mo_salah_dev/widgets/effects/float_animation.dart';
import '../../core/utils/responsive_extensions.dart';
import 'about_section_theme.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  static const Alignment _capsuleAlignment = Alignment(-9, -2.5);

  @override
  Widget build(BuildContext context) {
    final theme = AboutSectionTheme.of(context);
    final borderRadius = theme.cardRadius;

    final bool isDesktop = context.isDesktop;

    return Tilt3D(
      maxTilt: 10,
      scale: 1.03,
      duration: const Duration(milliseconds: 250),
      enableGlare: false,
      child: ConstrainedBox(
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
                      ? 'lib/core/assets/photos/developper/avatar.png'
                      : 'lib/core/assets/photos/developper/avatar_with_cappsulle.jpg';

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Image.asset(baseImage, fit: BoxFit.cover),
                      ),
                      if (isDesktop) ...[
                        Align(
                          alignment: _capsuleAlignment,
                          child: FloatAnimation(
                            beginOffset: -7.0,
                            endOffset: 3.5,
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
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: Align(
                            alignment: _capsuleAlignment,
                            child: FloatAnimation(
                              beginOffset: -20.0,
                              endOffset: 10.0,
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
                                  'lib/core/assets/photos/developper/cappsulle.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
