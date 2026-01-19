import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Theme.of(
        context,
      ).colorScheme.primary.withValues(alpha: .1),
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w500,
      ),
      side: BorderSide(color: Theme.of(context).colorScheme.primary),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    );
  }
}
