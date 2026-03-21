import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import '../../constants/app_layout.dart';
import 'action_icon_button.dart';

class HeaderActions extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ValueChanged<String>? onLanguageSelected;
  final String currentLanguage;
  final double? iconSizeOverride;
  final double? spacingOverride;

  const HeaderActions({
    super.key,
    required this.onThemeToggle,
    this.onLanguageSelected,
    required this.currentLanguage,
    this.iconSizeOverride,
    this.spacingOverride,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = AppLayout.fromWidth(constraints.maxWidth);
        final bool isMobile = layout.isMobile;
        final double? iconSize = iconSizeOverride ?? (isMobile ? 18 : null);
        final double gap = spacingOverride ?? (isMobile ? 6 : 10);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionIconButton(
              tooltip: isDark ? AppStrings.switchLight : AppStrings.switchDark,
              icon: isDark ? Icons.light_mode : Icons.dark_mode,
              onTap: onThemeToggle,
              iconSize: iconSize,
              splashRadius: iconSize != null ? iconSize + 6 : null,
            ),
            SizedBox(width: gap),
            ActionIconButton.menu(
              tooltip: AppStrings.language,
              icon: Icons.language,
              iconSize: iconSize,
              splashRadius: iconSize != null ? iconSize + 6 : null,
              menu: PopupMenuButton<String>(
                tooltip: AppStrings.language,
                initialValue: currentLanguage,
                onSelected: (value) => onLanguageSelected?.call(value),
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'EN', child: Text('English')),
                  PopupMenuItem(value: 'AR', child: Text('Arabic')),
                  PopupMenuItem(value: 'FR', child: Text('French')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
