part of '../../sections/contact_section.dart';

class _SignaturePlaceholder extends StatelessWidget {
  final ThemeData theme;
  final AppLayout layout;

  const _SignaturePlaceholder({required this.theme, required this.layout});

  @override
  Widget build(BuildContext context) {
    // Responsive signature width
    final targetWidth = layout.isDesktop
        ? 180.0
        : layout.isTablet
        ? 150.0
        : 120.0;

    final devicePixelRatio = View.of(context).devicePixelRatio;
    Color color = theme.colorScheme.onSurface;

    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: targetWidth),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          child: Image.asset(
            'lib/assets/photos/developper/signature.png',
            width: targetWidth,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            cacheWidth: (targetWidth * devicePixelRatio).round(),
            semanticLabel: 'Signature',
          ),
        ),
      ),
    );
  }
}
