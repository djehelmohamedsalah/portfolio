import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import '../../utils/responsive_extensions.dart';

/// Displays the app logo and (optionally) the brand text based on viewport width.
class ResponsiveLogo extends StatelessWidget {
  final VoidCallback onTap;

  const ResponsiveLogo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Centralized breakpoint: hide text on mobile screens.
    final showText = context.isTablet || context.isDesktop;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                "lib/assets/photos/developper/M_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            if (showText) ...[
              const SizedBox(width: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.schortname,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    AppStrings.schortname2,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
