import 'package:flutter/material.dart';

class SkillCategory {
  const SkillCategory({
    required this.title,
    required this.skills,
    required this.icon,
  });

  final String title;
  final List<String> skills;
  final IconData icon;
}
