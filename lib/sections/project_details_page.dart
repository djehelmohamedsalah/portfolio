import 'package:flutter/material.dart';
import 'package:portfolio/sections/image_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../constants/app_colors.dart';
import '../utils/responsive_layout.dart';

class ProjectDetailsPage extends StatefulWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // Determine if we are on a small screen
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.project.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                // Header Section
                // Header Section
                _buildHeader(context),
                const SizedBox(height: 40),

                // Main Content
                if (isMobile) ...[
                  _buildOverviewSection(context),
                  const SizedBox(height: 30),
                  _buildDetailsSection(context),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: _buildOverviewSection(context)),
                      const SizedBox(width: 40),
                      Expanded(flex: 1, child: _buildDetailsSection(context)),
                    ],
                  ),

                const SizedBox(height: 50),
                // Screenshots Placeholder
                _buildScreenshotsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ResponsiveLayout(
        mobile: Column(
          children: [
            Column(
              children: [
                Image.asset(
                  widget.project.logo,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.project.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Role',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            _buildRoleText(context, widget.project.role, TextAlign.center),
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    widget.project.logo,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.project.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Role',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                        overflow: TextOverflow.ellipsis,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildRoleText(context, widget.project.role, TextAlign.start),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Overview'),
        const SizedBox(height: 15),
        Text(
          widget.project.overview,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 30),
        _buildSectionTitle(context, 'Challenges & Solutions'),
        const SizedBox(height: 15),
        Text(
          widget.project.challenges,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 30),
        _buildSectionTitle(context, 'Tech Stack'),
        const SizedBox(height: 15),
        Text(
          widget.project.techStack,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.6,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem(context, 'Status', widget.project.status),
          const Divider(height: 30),
          _buildSectionTitle(context, 'Core Features'),
          const SizedBox(height: 10),
          Text(
            widget.project.coreFeatures,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),

          // Action Buttons Section
          if (widget.project.apkDownloadUrl != null ||
              widget.project.githubUrl != null ||
              widget.project.aptoideUrl != null) ...[
            const Divider(height: 30),
            _buildSectionTitle(context, 'Download & Links'),
            const SizedBox(height: 15),

            // Download APK Button
            if (widget.project.apkDownloadUrl != null)
              _buildActionButton(
                context,
                icon: Icons.download,
                label: 'Download APK',
                onPressed: () => _downloadApk(widget.project.apkDownloadUrl!),
                color: Theme.of(context).colorScheme.primary,
              ),

            if (widget.project.apkDownloadUrl != null)
              const SizedBox(height: 10),

            // GitHub Button
            if (widget.project.githubUrl != null)
              _buildActionButton(
                context,
                icon: Icons.code,
                label: 'View on GitHub',
                onPressed: () => _openInBrowser(widget.project.githubUrl!),
                color: Colors.grey.shade800,
              ),

            if (widget.project.githubUrl != null) const SizedBox(height: 10),

            // Aptoide Button
            if (widget.project.aptoideUrl != null)
              _buildActionButton(
                context,
                icon: Icons.store,
                label: 'Get on Aptoide',
                onPressed: () => _openInBrowser(widget.project.aptoideUrl!),
                color: Colors.orange,
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildScreenshotsSection(BuildContext context) {
    if (widget.project.screenshots.isEmpty) {
      // Fallback for projects without screenshots
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, 'Screenshots'),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (context, index) {
                final isLandscape = index == 0;
                return Container(
                  width: isLandscape ? 500 : 200,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).dividerColor.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 50,
                          color: Theme.of(context).disabledColor,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          isLandscape
                              ? 'Landscape Screenshot'
                              : 'Screenshot $index',
                          style: TextStyle(
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Screenshots'),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.project.screenshots.length,
            itemBuilder: (context, index) {
              final isLandscape = index == 0;
              return Container(
                width: isLandscape ? 500 : 200,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).dividerColor.withValues(alpha: 0.5),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _showImageViewer(context, index),
                    child: Image.asset(
                      widget.project.screenshots[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Theme.of(context).disabledColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 5),
        Text(value, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }

  Widget _buildRoleText(
    BuildContext context,
    String roleText,
    TextAlign align,
  ) {
    List<String> lines = roleText
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: lines.map((line) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            line.trim(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              height: 1.5,
            ),
            textAlign: align,
          ),
        );
      }).toList(),
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

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }

  // Download APK directly
  void _downloadApk(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        throw 'Could not start download';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not open $url')));
      }
    }
  }

  // Open link in external browser
  void _openInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not open page';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not open $url')));
      }
    }
  }
}
