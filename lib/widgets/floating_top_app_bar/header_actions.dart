import 'package:flutter/material.dart';
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
          tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
          icon: isDark ? Icons.light_mode : Icons.dark_mode,
          onTap: onThemeToggle,
        ),
        const SizedBox(width: 10),
        ActionIconButton.menu(
          tooltip: 'Language',
          icon: Icons.language,
          menu: PopupMenuButton<String>(
            tooltip: 'Language',
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
