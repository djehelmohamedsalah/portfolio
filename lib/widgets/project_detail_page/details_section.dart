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
          _DetailItem(label: AppStrings.status, value: project.status),
          const Divider(height: 30),
          const _SectionTitle(AppStrings.corefeaturestitle),
          const SizedBox(height: 10),
          Text(
            project.coreFeatures,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          if (project.apkDownloadUrl != null ||
              project.githubUrl != null ||
              project.aptoideUrl != null) ...[
            const Divider(height: 30),
            const _SectionTitle(AppStrings.downloadandlinkstitle),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (project.apkDownloadUrl != null)
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.download,
                      label: AppStrings.downloadApkLabel,
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () => onDownloadApk(project.apkDownloadUrl!),
                    ),
                  ),
                if (project.apkDownloadUrl != null && project.githubUrl != null)
                  const SizedBox(width: 12),
                if (project.githubUrl != null)
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.code,
                      label: AppStrings.vieOnGithub,
                      color: Colors.grey.shade800,
                      onPressed: () => onOpenInBrowser(project.githubUrl!),
                    ),
                  ),
                if (project.githubUrl != null && project.aptoideUrl != null)
                  const SizedBox(width: 12),
                if (project.aptoideUrl != null)
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.store,
                      label: AppStrings.getOnApptoid,
                      color: Colors.orange,
                      onPressed: () => onOpenInBrowser(project.aptoideUrl!),
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

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
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
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);

    return SizedBox(
      height: 88,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: radius,
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
