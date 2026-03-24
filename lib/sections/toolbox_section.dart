import 'package:flutter/material.dart';
import 'package:mo_salah_dev/utils/app_layout.dart';
import 'package:mo_salah_dev/widgets/general_widgets/section_header.dart';
import '../../constants/app_strings.dart';
import '../../constants/tool_assets.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/toolbox_section/metro_tile.dart';
import '../../widgets/toolbox_section/toolbox_section_theme.dart';

class ToolboxSection extends StatelessWidget {
  const ToolboxSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = toolAssets;

    return ResponsiveLayout(
      builder: (context, layout) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final theme = ToolboxSectionTheme.of(context);
            final maxWidth = constraints.maxWidth;
            const outerPadding = 12.0;
            const tileSpacing = 6.0;

            final isPhone = maxWidth < Breakpoints.tablet;
            final isTablet = !isPhone && maxWidth < Breakpoints.desktop + 200;
            final isDesktop = !isPhone && !isTablet;

            double maxExtent;
            if (isDesktop) {
              maxExtent = 130;
            } else if (isTablet) {
              maxExtent = 120;
            } else {
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
                          return MetroTile(
                            tool: tool,
                            layout: layout,
                            showLabel: !isPhone,
                            iconSize: iconSize,
                            enableHover: isDesktop,
                            theme: theme,
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
