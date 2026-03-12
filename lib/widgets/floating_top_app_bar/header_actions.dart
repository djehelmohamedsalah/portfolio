import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'action_icon_button.dart';

class HeaderActions extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ValueChanged<String>? onLanguageSelected;
  final String currentLanguage;

  const HeaderActions({
    super.key,
    required this.onThemeToggle,
    this.onLanguageSelected,
    required this.currentLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionIconButton(
          tooltip: isDark ? AppStrings.switchLight : AppStrings.switchDark,
          icon: isDark ? Icons.light_mode : Icons.dark_mode,
          onTap: onThemeToggle,
        ),
        const SizedBox(width: 10),
        ActionIconButton.menu(
          tooltip: AppStrings.language,
          icon: Icons.language,
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
  }
}
