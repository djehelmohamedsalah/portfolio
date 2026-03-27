part of '../../sections/project_details_page.dart';

class _DetailsSection extends StatelessWidget {
  final Project project;
  final void Function(String url) onDownloadApk;
  final void Function(String url) onOpenInBrowser;

  const _DetailsSection({
    required this.project,
    required this.onDownloadApk,
    required this.onOpenInBrowser,
  });

  @override
  Widget build(BuildContext context) {
    final bodySize = scaleForLayout(context, 15, 17);
    final labelSize = scaleForLayout(context, 13, 15);
    final actionIconSize = scaleForLayout(context, 20, 24);
    final actionHeight = scaleForLayout(context, 78, 92);
    final strings = context.watch<StringsProvider>().strings;

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
          _SectionTitle(strings.status),
          const SizedBox(height: 10),
          SelectableText(
            project.status,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: bodySize),
          ),
          const Divider(height: 30),
          _SectionTitle(strings.corefeaturestitle),
          const SizedBox(height: 10),
          RevealOnScroll(
            child: SelectableText(
              project.coreFeatures,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.5, fontSize: bodySize),
            ),
          ),
          if (project.apkDownloadUrl != null ||
              project.githubUrl != null ||
              project.aptoideUrl != null) ...[
            const Divider(height: 30),
            _SectionTitle(strings.downloadandlinkstitle),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (project.apkDownloadUrl != null)
                  Expanded(
                    child: RevealOnScroll(
                      child: _ActionButton(
                        icon: Icons.download,
                        label: strings.downloadApkLabel,
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () => onDownloadApk(project.apkDownloadUrl!),
                        height: actionHeight,
                        iconSize: actionIconSize,
                        textSize: labelSize,
                      ),
                    ),
                  ),
                if (project.apkDownloadUrl != null && project.githubUrl != null)
                  const SizedBox(width: 12),
                if (project.githubUrl != null)
                  Expanded(
                    child: RevealOnScroll(
                      child: _ActionButton(
                        icon: Icons.code,
                        label: strings.vieOnGithub,
                        color: Theme.of(context).colorScheme.onTertiary,
                        onPressed: () => onOpenInBrowser(project.githubUrl!),
                        height: actionHeight,
                        iconSize: actionIconSize,
                        textSize: labelSize,
                      ),
                    ),
                  ),
                if (project.githubUrl != null && project.aptoideUrl != null)
                  const SizedBox(width: 12),
                if (project.aptoideUrl != null)
                  Expanded(
                    child: RevealOnScroll(
                      child: _ActionButton(
                        icon: Icons.store,
                        label: strings.getOnApptoid,
                        color: Colors.orange,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: SelectableText(
                                strings
                                    .getOnApptoid, // Or some other dynamic text if available
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        height: actionHeight,
                        iconSize: actionIconSize,
                        textSize: labelSize,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final double height;
  final double iconSize;
  final double textSize;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
    required this.height,
    required this.iconSize,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: radius,
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: radius,
                  border: Border.all(
                    color: color.withValues(alpha: 0.4),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(icon, size: 22, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                  fontSize: textSize,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
