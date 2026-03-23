part of '../../sections/project_details_page.dart';

class _HeaderSection extends StatelessWidget {
  final Project project;

  const _HeaderSection({required this.project});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final isMobile = layout.isMobile;
    final logoSize = scaleForLayout(context, 90, 220);
    final titleSize = scaleForLayout(context, 22, 34);
    final roleTitleSize = scaleForLayout(context, 16, 20);

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
      child: isMobile
          ? Column(
              children: [
                Column(
                  children: [
                    Image.asset(project.logo,
                        height: logoSize, fit: BoxFit.contain),
                    const SizedBox(height: 20),
                    Text(
                      project.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                                overflow: TextOverflow.ellipsis,
                                fontSize: titleSize,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  AppStrings.roleTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                        overflow: TextOverflow.ellipsis,
                        fontSize: roleTitleSize,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                _RoleText(roleText: project.role, align: TextAlign.center),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(project.logo,
                          height: logoSize, fit: BoxFit.contain),
                      const SizedBox(height: 20),
                      Text(
                        project.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                              overflow: TextOverflow.ellipsis,
                              fontSize: titleSize,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.roleTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                                overflow: TextOverflow.ellipsis,
                                fontSize: roleTitleSize,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _RoleText(roleText: project.role, align: TextAlign.start),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
