import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../utils/responsive_layout.dart';
import 'typewriter_text.dart';
import 'gradient_title.dart';
import 'online_indicator.dart';

class HeroIntro extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onHireMe;
  final bool showButtons;

  const HeroIntro({
    super.key,
    required this.onViewWork,
    required this.onHireMe,
    this.showButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final bool isMobile = layout.isMobile;
    final bool isCentered = layout.isMobile || layout.isTablet;
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
      crossAxisAlignment: isCentered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        OnlineIndicator(
          color: theme.colorScheme.primary,
          label: AppStrings.openTowork,
          textStyle: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            fontSize: badgeTextSize,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            crossAxisAlignment: isCentered
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              GradientTitle(
                text: AppStrings.homeTitleFirstPart,
                fontSize: titleSize,
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
              ),
              GradientTitle(
                text: AppStrings.homeTitleSecondPart,
                fontSize: titleSize,
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
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
          alignment: isCentered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
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
          child: SelectableText(
            AppStrings.hookText,
            textAlign: isCentered ? TextAlign.center : TextAlign.start,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: isMobile ? 14 : hookTextSize,
              height: 1.6,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
              color: theme.textTheme.bodyLarge?.color?.withValues(alpha: 0.85),
            ),
          ),
        ),
        if (showButtons) ...[
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
      ],
    );
  }
}
