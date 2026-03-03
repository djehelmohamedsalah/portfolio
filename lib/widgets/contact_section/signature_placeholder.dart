part of '../../sections/contact_section.dart';

class _SignaturePlaceholder extends StatelessWidget {
  final ThemeData theme;
  const _SignaturePlaceholder({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        'lib/assets/photos/developper/signature.png',
        width: 180,
        fit: BoxFit.contain,
        semanticLabel: 'Signature',
        colorBlendMode: BlendMode.dstIn,
        color: Colors.white,
      ),
    );
  }
}
