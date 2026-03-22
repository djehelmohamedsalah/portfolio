import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/constants/tool_assets.dart';
import 'package:mo_salah_dev/utils/app_layout.dart';
import 'package:mo_salah_dev/utils/responsive_layout.dart';
import 'package:mo_salah_dev/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolboxSection extends StatelessWidget {
  const ToolboxSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = toolAssets;

    return ResponsiveLayout(
      builder: (context, layout) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            const outerPadding = 12.0;
            const tileSpacing = 6.0;

            final isPhone = maxWidth < Breakpoints.tablet;
            final isTablet =
                !isPhone && maxWidth < Breakpoints.desktop + 200; // approx 1100
            final isDesktop = !isPhone && !isTablet;

            // Max extents ensure compact squares; min extent guarantees density.
            double maxExtent;
            if (isDesktop) {
              maxExtent = 130;
            } else if (isTablet) {
              maxExtent = 120;
            } else {
              // phone: fit >=3 tiles per row
              maxExtent = ((maxWidth / 3) - tileSpacing).clamp(90, 120);
            }

            final gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxExtent,
              crossAxisSpacing: tileSpacing,
              mainAxisSpacing: tileSpacing,
              childAspectRatio: 1,
            );

            final iconSize = isDesktop
                ? 38.0
                : isTablet
                ? 34.0
                : 30.0;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: layout.maxContentWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: outerPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SectionHeader(
                        title: AppStrings.toolsTitle,
                        subtitle: AppStrings.toolsSubtitle,
                      ),
                      SizedBox(height: layout.blockSpacing * 0.5),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tools.length,
                        gridDelegate: gridDelegate,
                        itemBuilder: (context, index) {
                          final tool = tools[index];
                          return _MetroTile(
                            tool: tool,
                            layout: layout,
                            showLabel: !isPhone,
                            iconSize: iconSize,
                            enableHover: isDesktop,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _MetroTile extends StatefulWidget {
  final ToolAsset tool;
  final AppLayout layout;
  final bool showLabel;
  final double iconSize;
  final bool enableHover;

  const _MetroTile({
    required this.tool,
    required this.layout,
    required this.showLabel,
    required this.iconSize,
    required this.enableHover,
  });

  @override
  State<_MetroTile> createState() => _MetroTileState();
}

class _MetroTileState extends State<_MetroTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final scale = widget.enableHover && _hover ? 1.03 : 1.0;

    final tile = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      transform: Matrix4.identity()..scale(scale),
      transformAlignment: Alignment.center,
      padding: EdgeInsets.all(widget.layout.itemSpacing * 0.9),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _ToolIcon(
            tool: widget.tool,
            size: widget.iconSize,
            color: colorScheme.primary,
          ),
          if (widget.showLabel) ...[
            SizedBox(height: widget.layout.itemSpacing * 0.4),
            Text(
              widget.tool.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ],
      ),
    );

    final child = widget.enableHover
        ? MouseRegion(
            onEnter: (_) => setState(() => _hover = true),
            onExit: (_) => setState(() => _hover = false),
            cursor: SystemMouseCursors.click,
            child: tile,
          )
        : tile;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _openToolUrl(context, widget.tool.url),
        borderRadius: BorderRadius.circular(6),
        child: child,
      ),
    );
  }
}

class _ToolIcon extends StatelessWidget {
  final ToolAsset tool;
  final double size;
  final Color color;

  const _ToolIcon({
    required this.tool,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (tool.isSvg) {
      return SvgPicture.asset(
        tool.path,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        semanticsLabel: tool.name,
      );
    }
    return Image.asset(tool.path, width: size, height: size, color: color);
  }
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
  ).showSnackBar(const SnackBar(content: Text(AppStrings.urlNotOpen)));
}
