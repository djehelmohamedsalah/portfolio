import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

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
      labelStyle: const TextStyle(color: AppColors.white),
      side: BorderSide(color: Theme.of(context).colorScheme.primary),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    );
  }
}
