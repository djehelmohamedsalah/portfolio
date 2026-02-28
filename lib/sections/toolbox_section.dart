import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolboxSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ToolboxSection({super.key, required this.sectionKey});

  static const List<_ToolAsset> _tools = [
    _ToolAsset('Flutter', 'lib/assets/photos/tools_icons/flutter.svg'),
    _ToolAsset('Dart', 'lib/assets/photos/tools_icons/dart.svg'),
    _ToolAsset('GitHub', 'lib/assets/photos/tools_icons/github.svg'),
    // _ToolAsset('Git', 'lib/assets/photos/tools_icons/git.svg'),
    _ToolAsset('Supabase', 'lib/assets/photos/tools_icons/supabase.svg'),
    _ToolAsset('VS Code', 'lib/assets/photos/tools_icons/vscode.svg'),
    _ToolAsset(
      'Android Studio',
      'lib/assets/photos/tools_icons/android_studio.svg',
    ),
    _ToolAsset('Figma', 'lib/assets/photos/tools_icons/figma.svg'),
    _ToolAsset('Postman', 'lib/assets/photos/tools_icons/postman.svg'),
    _ToolAsset('Bloc', 'lib/assets/photos/tools_icons/bloc.png', isSvg: false),
    _ToolAsset('GetX', 'lib/assets/photos/tools_icons/getx.png', isSvg: false),
  ];

  int _crossAxisCount(double width) {
    if (width >= 1100) return 5;
    if (width >= 900) return 4;
    if (width >= 520) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: KeyedSubtree(
            key: sectionKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Toolbox',
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Essential tools I use daily to design, build, and ship robust Flutter experiences.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final count = _crossAxisCount(constraints.maxWidth);
                    final spacing = 28.0;
                    final itemWidth =
                        (constraints.maxWidth - spacing * (count - 1)) / count;

                    return Wrap(
                      alignment: WrapAlignment.center,
                      spacing: spacing,
                      runSpacing: spacing,
                      children: _tools
                          .map(
                            (tool) => SizedBox(
                              width: itemWidth,
                              child: Center(child: _ToolLogo(asset: tool)),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolLogo extends StatefulWidget {
  final _ToolAsset asset;

  const _ToolLogo({required this.asset});

  @override
  State<_ToolLogo> createState() => _ToolLogoState();
}

class _ToolLogoState extends State<_ToolLogo> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final child = widget.asset.isSvg
        ? SvgPicture.asset(
            widget.asset.path,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          )
        : Image.asset(
            widget.asset.path,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        child: child,
      ),
    );
  }
}

class _ToolAsset {
  final String name;
  final String path;
  final bool isSvg;

  const _ToolAsset(this.name, this.path, {this.isSvg = true});
}
