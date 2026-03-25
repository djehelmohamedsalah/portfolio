import 'package:flutter/material.dart';

class HoverOutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const HoverOutlineButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<HoverOutlineButton> createState() => _HoverOutlineButtonState();
}

class _HoverOutlineButtonState extends State<HoverOutlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onSurface = theme.colorScheme.onSurface;
    final surface = theme.colorScheme.surface;

    final foreground = _hovering ? surface : onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(999),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            decoration: BoxDecoration(
              color: _hovering ? onSurface : Colors.transparent,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: _hovering ? onSurface : onSurface.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: Text(
              widget.label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
