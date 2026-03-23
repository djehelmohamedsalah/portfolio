part of '../../sections/contact_section.dart';

class HoverIconButton extends StatefulWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;
  final bool tintWithTheme;
  final Color? tintColor;
  final bool isSvg;
  final double size;
  final double padding;

  const HoverIconButton({
    super.key,
    required this.assetPath,
    required this.label,
    required this.onTap,
    this.tintWithTheme = false,
    this.tintColor,
    this.isSvg = true,
    this.size = 28,
    this.padding = 12,
  });

  @override
  State<HoverIconButton> createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final tint = widget.tintWithTheme
        ? Theme.of(context).colorScheme.onTertiary.withValues(alpha: 0.78)
        : widget.tintColor;

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
              padding: EdgeInsets.all(widget.padding),
              child: tint != null
                  ? ColorFiltered(
                      colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
                      child: _buildAsset(),
                    )
                  : _buildAsset(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAsset() {
    return widget.isSvg
        ? SvgPicture.asset(
            widget.assetPath,
            width: widget.size,
            height: widget.size,
            semanticsLabel: widget.label,
          )
        : Image.asset(
            widget.assetPath,
            width: widget.size,
            height: widget.size,
          );
  }
}
