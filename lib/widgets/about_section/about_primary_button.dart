import 'package:flutter/material.dart';
import 'about_section_theme.dart';

class AboutPrimaryButton extends StatefulWidget {
  const AboutPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.padding,
  });

  final String label;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;

  @override
  State<AboutPrimaryButton> createState() => _AboutPrimaryButtonState();
}

class _AboutPrimaryButtonState extends State<AboutPrimaryButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = AboutSectionTheme.of(context);
    final padding =
        widget.padding ?? const EdgeInsets.symmetric(horizontal: 30, vertical: 16);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: padding,
          decoration: BoxDecoration(
            color: _hovering ? theme.buttonHoverBackground : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: theme.buttonBorder, width: 1.5),
          ),
          child: Center(
            child: Text(widget.label, style: theme.buttonLabelStyle(_hovering)),
          ),
        ),
      ),
    );
  }
}
