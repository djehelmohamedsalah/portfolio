part of '../../sections/contact_section.dart';

class _HoverIconButton extends StatefulWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;

  const _HoverIconButton({
    required this.assetPath,
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
          scale: _hover ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _hover ? 1 : 0.9,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                widget.assetPath,
                width: 28,
                height: 28,
                semanticsLabel: widget.label,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
