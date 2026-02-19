import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../widgets/typewriter_text.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewWork;
  final VoidCallback onHireMe;
  final VoidCallback? toAbout;

  const HeroSection({
    super.key,
    required this.sectionKey,
    required this.onViewWork,
    required this.onHireMe,
    this.toAbout,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    return SectionContainer(
      toAbout: toAbout,
      ishero: true,
      key: sectionKey,
      color: Colors.transparent,
      height: 620,
      child: Stack(
        children: [
          isMobile
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
        ],
      ),
    );
  }

  Widget _buildIntro(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    final theme = Theme.of(context);
    final double titleSize = isMobile ? 42 : 64;
    final double badgeTextSize = isMobile ? 12 : 14;
    final double roleTextSize = isMobile ? 22 : 30;
    final double hookTextSize = isMobile ? 15 : 17;
    final double buttonTextSize = isMobile ? 15 : 16;
    final ButtonStyle ctaButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
      minimumSize: const Size(180, 56),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: TextStyle(
        fontSize: buttonTextSize,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    ).copyWith(elevation: const WidgetStatePropertyAll(2));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.22),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _OnlineIndicator(color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Text(
                'Open to development opportunities and professional growth',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  fontSize: badgeTextSize,
                ),
              ),
            ],
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
                AppStrings.homeTitleFirstPart,
                titleSize,
              ),
              _buildGradientTitle(
                context,
                AppStrings.homeTitleSecondPart,
                titleSize,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        TypewriterText(
          cursor: "_",
          phrases: const [
            'Mobile Application Developer.',
            'Flutter Developer.',
            'Android Developer.',
            'Cross-Platform Developer.',
          ],
          style: TextStyle(
            fontSize: roleTextSize,
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
          cursorColor: theme.colorScheme.secondary,
          typingSpeed: const Duration(milliseconds: 70),
          erasingSpeed: const Duration(milliseconds: 90),
          pauseAfterTyping: const Duration(milliseconds: 900),
          pauseAfterErasing: const Duration(milliseconds: 400),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            AppStrings.hookText,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: hookTextSize,
              height: 1.6,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
              color: theme.textTheme.bodyLarge?.color?.withValues(alpha: 0.85),
            ),
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: onViewWork,
              style: ctaButtonStyle,
              child: const Text(AppStrings.viewMyWork),
            ),
            ElevatedButton(
              onPressed: onHireMe,
              style: ctaButtonStyle,
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

class _OnlineIndicator extends StatelessWidget {
  final Color color;

  const _OnlineIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 120),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
