import 'package:flutter/material.dart';
import 'package:mo_salah_dev/widgets/animations%20effects/tilt_3d.dart';

class PhotoStack extends StatelessWidget {
  final bool isMobile;

  const PhotoStack({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final double photoSize = isMobile ? 240 : 360;
    final double squareSize = isMobile ? 70 : 90;
    final BorderRadius borderRadius = BorderRadius.circular(isMobile ? 22 : 28);
    final Color accent = Theme.of(
      context,
    ).colorScheme.primary.withValues(alpha: 60);
    final Color accentStrong = Theme.of(
      context,
    ).colorScheme.secondary.withValues(alpha: 90);

    return Tilt3D(
      maxTilt: 10,
      scale: 1.03,
      duration: const Duration(milliseconds: 250),
      enableGlare: false,
      child: SizedBox(
        width: photoSize + squareSize,
        height: photoSize + squareSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: squareSize,
                height: squareSize,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 50),
                      blurRadius: 18,
                      offset: const Offset(6, 10),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: squareSize,
                height: squareSize,
                decoration: BoxDecoration(
                  color: accentStrong,
                  borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 60),
                      blurRadius: 18,
                      offset: const Offset(6, 10),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: photoSize,
                height: photoSize,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 200),
                      Colors.white.withValues(alpha: 120),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 140),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 80),
                      blurRadius: 24,
                      offset: const Offset(0, 18),
                    ),
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 80),
                      blurRadius: 32,
                      offset: const Offset(-6, -6),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Image.asset(
                    'lib/core/assets/photos/developper/suit_profile_picture.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
