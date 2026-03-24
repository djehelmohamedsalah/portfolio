import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/l10n/strings_provider.dart';
import 'package:mo_salah_dev/widgets/project_detail_page/image_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_colors.dart';
import '../models/project.dart';
import '../utils/responsive_layout.dart';

part '../widgets/project_detail_page/header_section.dart';
part '../widgets/project_detail_page/overview_section.dart';
part '../widgets/project_detail_page/details_section.dart';
part '../widgets/project_detail_page/screenshots_section.dart';
part '../widgets/project_detail_page/section_title.dart';
part '../widgets/project_detail_page/role_text.dart';

double scaleForLayout(BuildContext context, double min, double max) {
  final layout = context.layout;
  final width = layout.width.clamp(360.0, 1400.0);
  final t = (width - 360.0) / (1400.0 - 360.0);
  return min + (max - min) * t;
}

class ProjectDetailsPage extends StatefulWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      builder: (context, layout) {
        final isMobile = layout.isMobile;
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(widget.project.title),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const SizedBox(),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: layout.horizontalPadding,
              vertical: layout.sectionSpacing / 2,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: layout.maxContentWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderSection(project: widget.project),
                    const SizedBox(height: 40),
                    if (isMobile) ...[
                      _OverviewSection(project: widget.project),
                      const SizedBox(height: 30),
                      _DetailsSection(
                        project: widget.project,
                        onDownloadApk: _downloadApk,
                        onOpenInBrowser: _openInBrowser,
                      ),
                    ] else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _OverviewSection(project: widget.project),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            flex: 1,
                            child: _DetailsSection(
                              project: widget.project,
                              onDownloadApk: _downloadApk,
                              onOpenInBrowser: _openInBrowser,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 50),
                    _ScreenshotsSection(
                      project: widget.project,
                      onTapScreenshot: (index) =>
                          _showImageViewer(context, index),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showImageViewer(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return ImageViewerDialog(
          screenshots: widget.project.screenshots,
          initialIndex: initialIndex,
        );
      },
    );
  }

  void _downloadApk(String url) async {
    final uri = Uri.parse(url);
    final strings = Provider.of<StringsProvider>(context, listen: false).strings;
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw strings.downloadNotStart;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${strings.urlNotOpen} $url')),
        );
      }
    }
  }

  void _openInBrowser(String url) async {
    final uri = Uri.parse(url);
    final strings = Provider.of<StringsProvider>(context, listen: false).strings;
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw strings.pageNotOpen;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${strings.urlNotOpen} $url')),
        );
      }
    }
  }
}
