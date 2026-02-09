import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class HomeSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewWork;
  final VoidCallback onHireMe;

  const HomeSection({
    super.key,
    required this.sectionKey,
    required this.onViewWork,
    required this.onHireMe,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    return SectionContainer(
      key: sectionKey,
      title: AppStrings.homeSectionTitle,
      color: Colors.transparent,
      height: 700,
      child: isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntro(context),
                const SizedBox(height: 30),
                _buildPhotoStack(context, isMobile: isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 3, child: _buildIntro(context)),
                const SizedBox(width: 40),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _buildPhotoStack(context, isMobile: isMobile),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildIntro(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.homeTitleFirstPart,
                  style: TextStyle(
                    fontSize: isMobile ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).textTheme.displayLarge?.color!.withValues(blue: 20),
                    height: 1.1,
                    letterSpacing: -2,
                  ),
                ),
                Text(
                  AppStrings.homeTitleSecondPart,
                  style: TextStyle(
                    fontSize: isMobile ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).textTheme.displayLarge?.color!.withValues(blue: 40),
                    height: 1.1,
                    letterSpacing: -2,
                  ),
                ),
                Text(
                  AppStrings.homeTitleThirdPart,
                  style: TextStyle(
                    fontSize: isMobile ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).textTheme.displayLarge?.color!.withValues(blue: 60),
                    height: 1.1,
                    letterSpacing: -2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.homeTitleFourthPart,
                  style: TextStyle(
                    fontSize: isMobile ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).textTheme.displayLarge?.color!.withValues(blue: 80),
                    height: 1.1,
                    letterSpacing: -2,
                  ),
                ),
                Text(
                  AppStrings.homeTitlefifthPart,
                  style: TextStyle(
                    fontSize: isMobile ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(
                      context,
                    ).textTheme.displayLarge?.color!.withValues(blue: 100),
                    height: 1.1,
                    letterSpacing: -2,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          AppStrings.role,
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(
              onPressed: onViewWork,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(AppStrings.viewMyWork),
            ),
            const SizedBox(width: 30),
            ElevatedButton(
              onPressed: onHireMe,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(AppStrings.hireMe),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoStack(BuildContext context, {required bool isMobile}) {
    final double photoSize = isMobile ? 240 : 360;
    final double squareSize = isMobile ? 70 : 90;
    final BorderRadius borderRadius = BorderRadius.circular(isMobile ? 22 : 28);
    final Color accent = Theme.of(
      context,
    ).colorScheme.primary.withValues(alpha: 60);
    final Color accentStrong = Theme.of(
      context,
    ).colorScheme.secondary.withValues(alpha: 90);

    return SizedBox(
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
                  'lib/assets/photos/developper/suit_profile_picture.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
