import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/tool_assets.dart';

class ToolIcon extends StatelessWidget {
  const ToolIcon({super.key, required this.tool, required this.size, required this.color});

  final ToolAsset tool;
  final double size;
  final Color color;

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
