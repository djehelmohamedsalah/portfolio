import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/section_container.dart';
import 'package:mo_salah_dev/widgets/section_header.dart';

class ToolboxSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ToolboxSection({super.key, required this.sectionKey});

  static const List<_ToolAsset> _tools = [
    _ToolAsset(
      'Android Studio',
      'lib/assets/photos/tools_icons/androidstudio.svg',
    ),
    _ToolAsset('Api', 'lib/assets/photos/tools_icons/api.svg'),
    _ToolAsset('Supabase', 'lib/assets/photos/tools_icons/supabase.svg'),
    _ToolAsset('Dart', 'lib/assets/photos/tools_icons/dart.svg'),
    _ToolAsset('DotENV', 'lib/assets/photos/tools_icons/dotenv.svg'),
    _ToolAsset('Figma', 'lib/assets/photos/tools_icons/figma.svg'),
    _ToolAsset('Firebase', 'lib/assets/photos/tools_icons/firebase.svg'),
    _ToolAsset('Flutter', 'lib/assets/photos/tools_icons/flutter.svg'),
    _ToolAsset('GetX', 'lib/assets/photos/tools_icons/getx.svg'),
    _ToolAsset('Git', 'lib/assets/photos/tools_icons/git.svg'),
    _ToolAsset('GitHub', 'lib/assets/photos/tools_icons/github.svg'),
    _ToolAsset(
      'GitHub Copilot',
      'lib/assets/photos/tools_icons/githubcopilot.svg',
    ),
    _ToolAsset('Google Cloud', 'lib/assets/photos/tools_icons/googlecloud.svg'),
    _ToolAsset('Google Fonts', 'lib/assets/photos/tools_icons/googlefonts.svg'),
    _ToolAsset('Gemini', 'lib/assets/photos/tools_icons/googlegemini.svg'),
    _ToolAsset('Maps', 'lib/assets/photos/tools_icons/googlemaps.svg'),
    _ToolAsset('Postman', 'lib/assets/photos/tools_icons/postman.svg'),
    _ToolAsset('Python', 'lib/assets/photos/tools_icons/python.svg'),
    _ToolAsset('Sdk', 'lib/assets/photos/tools_icons/sdk.png', isSvg: false),
    _ToolAsset('Sqlite', 'lib/assets/photos/tools_icons/sqlite.svg'),
  ];

  int _crossAxisCount(double width) {
    if (width >= 1100) return 5;
    if (width >= 900) return 4;
    if (width >= 520) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return SectionContainer(
      key: sectionKey,
      color: Theme.of(context).colorScheme.surface,
      height: 500, // Reduced height for minimal look
      titleCentered: true,
      child: Column(
        children: [
          const SectionHeader(
            title: AppStrings.toolsTitle,
            subtitle: AppStrings.toolsSubtitle,
          ),
          const SizedBox(height: 100),
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
                        child: Center(
                          child: _ToolLogo(asset: tool, height: 58),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ToolLogo extends StatefulWidget {
  final _ToolAsset asset;
  final double height;

  const _ToolLogo({required this.asset, required this.height});

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
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.dst),
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
