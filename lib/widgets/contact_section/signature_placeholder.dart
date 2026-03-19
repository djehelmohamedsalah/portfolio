part of '../../sections/contact_section.dart';

class _SignaturePlaceholder extends StatelessWidget {
  final ThemeData theme;
  const _SignaturePlaceholder({required this.theme});

  @override
  Widget build(BuildContext context) {
    const targetWidth = 180.0;
    final devicePixelRatio = View.of(context).devicePixelRatio;
    Color color = theme.colorScheme.onSurface;
    return Align(
      alignment: Alignment.topLeft,
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
    );
  }
}
