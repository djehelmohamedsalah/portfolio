import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
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
    );
  }
}
