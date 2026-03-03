part of '../../sections/contact_section.dart';

class _SignaturePlaceholder extends StatelessWidget {
  final ThemeData theme;
  const _SignaturePlaceholder({required this.theme});

  @override
  Widget build(BuildContext context) {
    const targetWidth = 200.0;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return Align(
      alignment: Alignment.topRight,
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
