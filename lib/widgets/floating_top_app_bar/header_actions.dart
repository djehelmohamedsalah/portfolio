import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/floating_top_app_bar/nav_action.dart';
import 'action_icon_button.dart';

class HeaderActions extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ValueChanged<String>? onLanguageSelected;
  final String currentLanguage;
  final ValueChanged<NavAction> onSelected;

  const HeaderActions({
    super.key,
    required this.onThemeToggle,
    this.onLanguageSelected,
    required this.currentLanguage, required this.onSelected,
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
        ActionIconButton.menu(
      tooltip: AppStrings.navigatetooltip,
      icon: Icons.menu_rounded,
      menu: PopupMenuButton<String>(
        tooltip: AppStrings.navigatetooltip,
        onSelected: (value) {
          final action = NavAction.values
              .firstWhere((a) => a.name == value, orElse: () => NavAction.home);
          onSelected(action);
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'about', child: Text(AppStrings.aboutLabel)),
          PopupMenuItem(
              value: 'developmentProcess',
              child: Text(AppStrings.devProcesLabel)),
          PopupMenuItem(value: 'skills', child: Text(AppStrings.skillsLabel)),
          PopupMenuItem(
              value: 'projects', child: Text(AppStrings.projectsLabel)),
          PopupMenuItem(value: 'contact', child: Text(AppStrings.contactLabel)),
        ],
      ),
    ),
      ],
    );
  }
}
