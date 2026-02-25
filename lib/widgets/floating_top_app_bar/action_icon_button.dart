import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback? onTap;
  final PopupMenuButton<String>? menu;

  const ActionIconButton({
    super.key,
    required this.tooltip,
    required this.icon,
    required this.onTap,
  }) : menu = null;

  const ActionIconButton.menu({
    super.key,
    required this.tooltip,
    required this.icon,
    required this.menu,
  }) : onTap = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (menu != null) {
      return PopupMenuButton<String>(
        tooltip: tooltip,
        initialValue: menu!.initialValue,
        onSelected: menu!.onSelected,
        itemBuilder: menu!.itemBuilder,
        icon: Icon(icon, color: colorScheme.onSurface),
      );
    }

    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      icon: Icon(icon, color: colorScheme.onSurface),
      splashRadius: 20,
    );
  }
}
