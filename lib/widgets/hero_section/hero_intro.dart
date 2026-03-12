import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../utils/responsive_layout.dart';
import '../typewriter_text.dart';
import 'gradient_title.dart';
import 'online_indicator.dart';

class HeroIntro extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onHireMe;

  const HeroIntro({
    super.key,
    required this.onViewWork,
    required this.onHireMe,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    final theme = Theme.of(context);
    final double titleSize = isMobile ? 42 : 64;
    final double badgeTextSize = isMobile ? 12 : 14;
    final double roleTextSize = isMobile ? 22 : 30;
    final double hookTextSize = isMobile ? 15 : 17;
    final double buttonTextSize = isMobile ? 15 : 16;
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
              OnlineIndicator(color: theme.colorScheme.primary),
              const SizedBox(width: 10),
              Text(
                AppStrings.openTowork,
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
              GradientTitle(
                text: AppStrings.homeTitleFirstPart,
                fontSize: titleSize,
              ),
              GradientTitle(
                text: AppStrings.homeTitleSecondPart,
                fontSize: titleSize,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        TypewriterText(
          cursor: "_",
          phrases: const [
            AppStrings.typewriterText1,
            AppStrings.typewriterText2,
            AppStrings.typewriterText3,
            AppStrings.typewriterText4,
          ],
          style: TextStyle(
            fontSize: roleTextSize,
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
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
}
