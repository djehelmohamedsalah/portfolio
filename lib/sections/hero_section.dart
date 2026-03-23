import 'package:flutter/material.dart';
import '../widgets/general_widgets/section_container.dart';
import '../utils/responsive_layout.dart';
import '../widgets/hero_section/hero_intro.dart';
import '../widgets/hero_section/photo_stack.dart';
import '../constants/app_strings.dart';

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
    return ResponsiveLayout(
      builder: (context, layout) {
        final isDesktop = layout.isDesktop;
        return SectionContainer(
          toAbout: toAbout,
          ishero: true,
          key: sectionKey,
          color: Colors.transparent,
          height: 620,
          child: Stack(
            children: [
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: HeroIntro(
                        onViewWork: onViewWork,
                        onHireMe: onHireMe,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: PhotoStack(isMobile: layout.isMobile),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeroIntro(
                      onViewWork: onViewWork,
                      onHireMe: onHireMe,
                      showButtons: false,
                    ),
                    SizedBox(height: layout.blockSpacing * 0.75),
                    PhotoStack(isMobile: layout.isMobile),
                    SizedBox(height: layout.blockSpacing),
                    _HeroCtas(
                      onViewWork: onViewWork,
                      onHireMe: onHireMe,
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroCtas extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onHireMe;

  const _HeroCtas({
    required this.onViewWork,
    required this.onHireMe,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = context.layout;
    final double buttonTextSize = layout.isMobile ? 15 : 16;

    final ButtonStyle ctaButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: Colors.white,
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

    return Wrap(
      spacing: 20,
      runSpacing: 12,
      alignment: WrapAlignment.center,
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
    );
  }
}
