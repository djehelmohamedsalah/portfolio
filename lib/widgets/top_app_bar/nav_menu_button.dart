
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:mo_salah_dev/widgets/floating_top_app_bar/action_icon_button.dart';
import 'package:mo_salah_dev/widgets/floating_top_app_bar/nav_action.dart';

class NavMenuButton extends StatelessWidget {
  final ValueChanged<NavAction> onSelected;
  final double? iconSize;

  const NavMenuButton({super.key, required this.onSelected, this.iconSize});

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<StringsProvider>().strings;
    return ActionIconButton.menu(
      tooltip: strings.navigatetooltip,
      icon: Icons.menu_rounded,
      iconSize: iconSize,
      splashRadius: iconSize != null ? iconSize! + 6 : null,
      menu: PopupMenuButton<String>(
        tooltip: strings.navigatetooltip,
        onSelected: (value) {
          final action = NavAction.values.firstWhere(
            (a) => a.name == value,
            orElse: () => NavAction.home,
          );
          onSelected(action);
        },
        itemBuilder: (context) => [
          PopupMenuItem(value: 'about', child: Text(strings.aboutLabel)),
          PopupMenuItem(
            value: 'developmentProcess',
            child: Text(strings.devProcesLabel),
          ),
          PopupMenuItem(value: 'skills', child: Text(strings.skillsLabel)),
          PopupMenuItem(
            value: 'projects',
            child: Text(strings.projectsLabel),
          ),
          PopupMenuItem(value: 'contact', child: Text(strings.contactLabel)),
        ],
      ),
    );
  }
}
