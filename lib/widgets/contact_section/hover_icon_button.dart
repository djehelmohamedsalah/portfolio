part of '../../sections/contact_section.dart';

class HoverIconButton extends StatefulWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;
  final bool tintWithTheme;
  final bool isSvg;
  final double size;

  const HoverIconButton({
    required this.assetPath,
    required this.label,
    required this.onTap,
    this.tintWithTheme = false,
    this.isSvg = true,
    this.size = 28,
  });

  @override
  State<HoverIconButton> createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
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
          scale: _hover ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _hover ? 1 : 0.9,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: widget.isSvg
                  ? SvgPicture.asset(
                      widget.assetPath,
                      width: widget.size,
                      height: widget.size,
                      semanticsLabel: widget.label,
                      colorFilter: widget.tintWithTheme
                          ? ColorFilter.mode(
                              Theme.of(context).colorScheme.onTertiary,
                              BlendMode.srcIn,
                            )
                          : null,
                    )
                  : Image.asset(
                      widget.assetPath,
                      width: widget.size,
                      height: widget.size,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
