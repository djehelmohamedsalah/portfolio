import 'package:flutter/material.dart';
import '../widgets/section_container.dart';
import '../utils/responsive_layout.dart';
import '../widgets/hero_section/hero_intro.dart';
import '../widgets/hero_section/photo_stack.dart';

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
        final isMobile = layout.isMobile;
        return SectionContainer(
          toAbout: toAbout,
          ishero: true,
          key: sectionKey,
          color: Colors.transparent,
          height: 620,
          child: Stack(
            children: [
              if (isMobile)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroIntro(onViewWork: onViewWork, onHireMe: onHireMe),
                    const SizedBox(height: 30),
                    PhotoStack(isMobile: isMobile),
                  ],
                )
              else
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
                        child: PhotoStack(isMobile: isMobile),
                      ),
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
