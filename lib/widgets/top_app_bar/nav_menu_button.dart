
import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/floating_top_app_bar/action_icon_button.dart';
import 'package:mo_salah_dev/widgets/floating_top_app_bar/nav_action.dart';

class NavMenuButton extends StatelessWidget {
  final ValueChanged<NavAction> onSelected;
  final double? iconSize;

  const NavMenuButton({super.key, required this.onSelected, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return ActionIconButton.menu(
      tooltip: AppStrings.navigatetooltip,
      icon: Icons.menu_rounded,
      iconSize: iconSize,
      splashRadius: iconSize != null ? iconSize! + 6 : null,
      menu: PopupMenuButton<String>(
        tooltip: AppStrings.navigatetooltip,
        onSelected: (value) {
          final action = NavAction.values.firstWhere(
            (a) => a.name == value,
            orElse: () => NavAction.home,
          );
          onSelected(action);
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'about', child: Text(AppStrings.aboutLabel)),
          PopupMenuItem(
            value: 'developmentProcess',
            child: Text(AppStrings.devProcesLabel),
          ),
          PopupMenuItem(value: 'skills', child: Text(AppStrings.skillsLabel)),
          PopupMenuItem(
            value: 'projects',
            child: Text(AppStrings.projectsLabel),
          ),
          PopupMenuItem(value: 'contact', child: Text(AppStrings.contactLabel)),
        ],
      ),
    );
  }
}
