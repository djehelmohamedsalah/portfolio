import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'package:mo_salah_dev/core/utils/app_layout.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/tool_assets.dart';
import 'tool_icon.dart';
import 'toolbox_section_theme.dart';

class MetroTile extends StatefulWidget {
  const MetroTile({
    super.key,
    required this.tool,
    required this.layout,
    required this.showLabel,
    required this.iconSize,
    required this.enableHover,
    required this.theme,
  });

  final ToolAsset tool;
  final AppLayout layout;
  final bool showLabel;
  final double iconSize;
  final bool enableHover;
  final ToolboxSectionTheme theme;

  @override
  State<MetroTile> createState() => _MetroTileState();
}

class _MetroTileState extends State<MetroTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final scale = widget.enableHover && _hover ? 1.03 : 1.0;

    final tile = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      transform: Matrix4.identity()..scale(scale),
      transformAlignment: Alignment.center,
      padding: EdgeInsets.all(widget.layout.itemSpacing * 0.9),
      decoration: BoxDecoration(
        color: widget.theme.tileBackground.withValues(alpha: 0.3),
        borderRadius: widget.theme.tileRadius,
        border: Border.all(color: widget.theme.tileBorder, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ToolIcon(
            tool: widget.tool,
            size: widget.iconSize,
            color: widget.theme.colorScheme.primary,
          ),
          if (widget.showLabel) ...[
            SizedBox(height: widget.layout.itemSpacing * 0.4),
            Text(
              widget.tool.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: widget.theme.tileLabelStyle(),
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
        borderRadius: widget.theme.tileRadius,
        child: child,
      ),
    );
  }
}

Future<void> _openToolUrl(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return;
  }
  if (!context.mounted) return;
  final strings = Provider.of<StringsProvider>(context, listen: false).strings;
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(strings.urlNotOpen)));
}
