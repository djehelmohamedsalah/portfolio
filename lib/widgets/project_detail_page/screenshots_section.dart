part of '../../sections/project_details_page.dart';

class _ScreenshotsSection extends StatelessWidget {
  final Project project;
  final ValueChanged<int> onTapScreenshot;

  const _ScreenshotsSection({
    required this.project,
    required this.onTapScreenshot,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<StringsProvider>().strings;
    if (project.screenshots.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(strings.screenSchotsTitle),
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
                    ).colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.75,
                        ),
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
        _SectionTitle(strings.screenSchotsTitle),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: project.screenshots.length,
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
                    onTap: () => onTapScreenshot(index),
                    child: ProjectScreenshotImage(
                      assetPath: project.screenshots[index],
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(15),
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
}
