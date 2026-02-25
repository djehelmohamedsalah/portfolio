import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const SocialButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {},
      tooltip: label,
      icon: Icon(icon),
      color: theme.colorScheme.onSurface,
      splashRadius: 20,
    );
  }
}
