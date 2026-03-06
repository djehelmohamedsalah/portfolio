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
    if (width >= 1100) return 5; // desktop
    if (width >= 720) return 3; // tablet
    return 2; // mobile
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
              final spacing = 18.0;
              final assetsByName = {
                for (final tool in toolAssets) tool.name: tool,
              };
              final orderedTools = _orderedToolNames
                  .map((name) => assetsByName[name])
                  .whereType<ToolAsset>()
                  .toList();

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                ),
                itemCount: orderedTools.length,
                itemBuilder: (context, index) =>
                    Center(child: _ToolItem(asset: orderedTools[index])),
              );
            },
          ),
        ],
      ),
    );
  }

  static const List<String> _orderedToolNames = [
    // Development
    'Flutter',
    'Dart',
    'Python',
    // Backend / APIs
    'Supabase',
    'Firebase',
    'REST API',
    // Tools
    'Git',
    'GitHub',
    'Postman',
    // Design
    'Figma',
  ];
}

class _ToolItem extends StatefulWidget {
  final ToolAsset asset;

  const _ToolItem({required this.asset});

  @override
  State<_ToolItem> createState() => _ToolItemState();
}

class _ToolItemState extends State<_ToolItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = widget.asset.isSvg
        ? SvgPicture.asset(
            widget.asset.path,
            height: 30,
            width: 30,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.outline,
              BlendMode.srcIn,
            ),
          )
        : Image.asset(
            widget.asset.path,
            height: 30,
            width: 30,
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: 100,
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? theme.colorScheme.primary.withValues(alpha: 0.18)
                    : Colors.transparent,
                blurRadius: 12,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: _hovered
                  ? theme.colorScheme.primary.withValues(alpha: 0.35)
                  : theme.colorScheme.outline.withValues(alpha: 0.18),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedScale(
                scale: _hovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: Center(child: icon),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                widget.asset.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.82),
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
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
