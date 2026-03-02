import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo_salah_dev/constants/tool_assets.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/section_container.dart';
import 'package:mo_salah_dev/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolboxSection extends StatelessWidget {
  const ToolboxSection({super.key});

  int _crossAxisCount(double width) {
    if (width >= 1100) return 5;
    if (width >= 900) return 4;
    if (width >= 520) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      color: Theme.of(context).colorScheme.surface,
      height: 500,
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
                children: toolAssets
                    .map(
                      (tool) => SizedBox(
                        width: itemWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Center(
                            child: _ToolLogo(asset: tool, height: 48),
                          ),
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
  final ToolAsset asset;
  final double height;

  const _ToolLogo({required this.asset, required this.height});

  @override
  State<_ToolLogo> createState() => _ToolLogoState();
}

class _ToolLogoState extends State<_ToolLogo> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = widget.asset.isSvg
        ? SvgPicture.asset(
            widget.asset.path,
            height: widget.height,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.outline,
              BlendMode.srcIn,
            ),
          )
        : Image.asset(
            widget.asset.path,
            height: widget.height,
            fit: BoxFit.contain,
            color: theme.colorScheme.outline,
            colorBlendMode: BlendMode.srcIn,
          );

    return GestureDetector(
      onTap: () => _openToolUrl(context, widget.asset.url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedScale(
          scale: _hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          child: child,
        ),
      ),
    );
  }

  Future<void> _openToolUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Unable to open link.')));
  }
}
