import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo_salah_dev/constants/tool_assets.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'package:mo_salah_dev/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolboxSection extends StatelessWidget {
  const ToolboxSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = toolAssets;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SectionHeader(
                title: AppStrings.toolsTitle,
                subtitle: AppStrings.toolsSubtitle,
              ),
              const SizedBox(height: 48),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tools.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 140,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 32,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final tool = tools[index];
                  final icon = tool.isSvg
                      ? SvgPicture.asset(
                          tool.path,
                          width: 56,
                          height: 56,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          tool.path,
                          width: 56,
                          height: 56,
                          fit: BoxFit.contain,
                        );

                  return GestureDetector(
                    onTap: () => _openToolUrl(context, tool.url),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icon,
                        const SizedBox(height: 12),
                        Text(
                          tool.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('Unable to open link.')));
}
