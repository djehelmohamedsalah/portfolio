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
          _DetailItem(label: 'Status', value: project.status),
          const Divider(height: 30),
          const _SectionTitle('Core Features'),
          const SizedBox(height: 10),
          Text(
            project.coreFeatures,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
          if (project.apkDownloadUrl != null ||
              project.githubUrl != null ||
              project.aptoideUrl != null) ...[
            const Divider(height: 30),
            const _SectionTitle('Download & Links'),
            const SizedBox(height: 15),
            if (project.apkDownloadUrl != null)
              _ActionButton(
                icon: Icons.download,
                label: 'Download APK',
                color: Theme.of(context).colorScheme.primary,
                onPressed: () => onDownloadApk(project.apkDownloadUrl!),
              ),
            if (project.apkDownloadUrl != null) const SizedBox(height: 10),
            if (project.githubUrl != null)
              _ActionButton(
                icon: Icons.code,
                label: 'View on GitHub',
                color: Colors.grey.shade800,
                onPressed: () => onOpenInBrowser(project.githubUrl!),
              ),
            if (project.githubUrl != null) const SizedBox(height: 10),
            if (project.aptoideUrl != null)
              _ActionButton(
                icon: Icons.store,
                label: 'Get on Aptoide',
                color: Colors.orange,
                onPressed: () => onOpenInBrowser(project.aptoideUrl!),
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
}
