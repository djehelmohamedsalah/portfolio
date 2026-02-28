import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/section_container.dart';
import '../widgets/section_header.dart';

class ToolboxSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ToolboxSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionContainer(
      key: sectionKey,
      color: theme.colorScheme.surface,
      height: 420,
      titleCentered: true,
      child: Column(
        children: const [
          SectionHeader(
            title: 'Toolbox',
            subtitle:
                'Practical tools I rely on daily for building, debugging, and delivering polished apps.',
          ),
          SizedBox(height: 48),
          _ToolsGrid(),
        ],
      ),
    );
  }
}

class _ToolsGrid extends StatelessWidget {
  const _ToolsGrid();

  static const double _logoHeight = 48;
  static const double _spacing = 28;

  static const List<_ToolAsset> _tools = [
    _ToolAsset('Flutter', 'lib/assets/photos/tools_icons/flutter.svg'),
    _ToolAsset('Dart', 'lib/assets/photos/tools_icons/dart.svg'),
    _ToolAsset('GitHub', 'lib/assets/photos/tools_icons/github.svg'),
    _ToolAsset('Git', 'lib/assets/photos/tools_icons/git.svg'),
    _ToolAsset('Supabase', 'lib/assets/photos/tools_icons/supabase.svg'),
    _ToolAsset('VS Code', 'lib/assets/photos/tools_icons/vscode.svg'),
    _ToolAsset(
      'Android Studio',
      'lib/assets/photos/tools_icons/android_studio.png',
      isSvg: false,
    ),
    _ToolAsset('Figma', 'lib/assets/photos/tools_icons/figma.svg'),
    _ToolAsset('Postman', 'lib/assets/photos/tools_icons/postman.svg'),
    _ToolAsset('Bloc', 'lib/assets/photos/tools_icons/bloc.svg'),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _crossAxisCount(constraints.maxWidth);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _tools.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: _spacing,
            mainAxisSpacing: _spacing,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (context, index) {
            return _ToolLogo(
              asset: _tools[index],
              height: _logoHeight,
            );
          },
        );
      },
    );
  }
}

class _ToolLogo extends StatefulWidget {
  final _ToolAsset asset;
  final double height;

  const _ToolLogo({
    required this.asset,
    required this.height,
  });

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
            height: widget.height,
            fit: BoxFit.contain,
          )
        : Image.asset(
            widget.asset.path,
            height: widget.height,
            fit: BoxFit.contain,
          );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        child: Center(child: child),
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
