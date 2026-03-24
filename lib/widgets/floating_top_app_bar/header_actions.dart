import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/localization/strings_provider.dart';
import '../../utils/app_layout.dart';
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
    final strings = context.watch<StringsProvider>().strings;
    final stringsProvider = context.read<StringsProvider>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = AppLayout.fromWidth(constraints.maxWidth);
        final bool isMobile = layout.isMobile;
        final double? iconSize = iconSizeOverride ?? (isMobile ? 18 : null);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ActionIconButton(
              tooltip: isDark ? strings.switchLight : strings.switchDark,
              icon: isDark ? Icons.light_mode : Icons.dark_mode,
              onTap: onThemeToggle,
              iconSize: iconSize,
              splashRadius: iconSize != null ? iconSize + 6 : null,
            ),
            const SizedBox(width: 0),
            ActionIconButton.menu(
              tooltip: strings.language,
              icon: Icons.language,
              iconSize: iconSize,
              splashRadius: iconSize != null ? iconSize + 6 : null,
              menu: PopupMenuButton<String>(
                tooltip: strings.language,
                initialValue: stringsProvider.currentLocale.languageCode.toUpperCase(),
                onSelected: (value) {
                  final locale = value == 'DE' ? const Locale('de') : const Locale('en');
                  stringsProvider.setLanguage(locale);
                  onLanguageSelected?.call(value);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'EN', child: Text('English')),
                  const PopupMenuItem(value: 'DE', child: Text('Deutsch')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
