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
    final theme = Theme.of(context);
    final double titleSize = isMobile ? 44 : 68;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.28),
            ),
          ),
          child: Text(
            AppStrings.homeSectionTitle.toUpperCase(),
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGradientTitle(
                context,
                '${AppStrings.homeTitleFirstPart}${AppStrings.homeTitleSecondPart}${AppStrings.homeTitleThirdPart}',
                titleSize,
              ),
              _buildGradientTitle(
                context,
                '${AppStrings.homeTitleFourthPart}${AppStrings.homeTitlefifthPart}',
                titleSize,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.role,
          style: TextStyle(
            fontSize: isMobile ? 20 : 28,
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: onViewWork,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 18,
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text(AppStrings.viewMyWork),
            ),
            ElevatedButton(
              onPressed: onHireMe,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 18,
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

  Widget _buildGradientTitle(
    BuildContext context,
    String text,
    double fontSize,
  ) {
    final theme = Theme.of(context);
    final gradient = LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1.05,
          letterSpacing: -1.5,
        ),
      ),
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
