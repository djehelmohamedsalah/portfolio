part of '../../sections/contact_section.dart';

class _HoverIconButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HoverIconButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_HoverIconButton> createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<_HoverIconButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hover ? 1.08 : 1.0,
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 140),
            opacity: _hover ? 0.9 : 0.75,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 28,
                semanticLabel: widget.label,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
