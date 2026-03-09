import 'package:flutter/material.dart';
import 'package:mo_salah_dev/sections/image_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_colors.dart';
import '../../models/project.dart';
import '../../utils/responsive_layout.dart';

part 'header_section.dart';
part 'overview_section.dart';
part 'details_section.dart';
part 'screenshots_section.dart';
part 'section_title.dart';
part 'role_text.dart';

class ProjectDetailsPage extends StatefulWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
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
                  onTapScreenshot: (index) => _showImageViewer(context, index),
                ),
              ],
            ),
          ),
        ),
      ),
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
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not start download';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Could not open $url')));
      }
    }
  }

  void _openInBrowser(String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not open page';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Could not open $url')));
      }
    }
  }
}
