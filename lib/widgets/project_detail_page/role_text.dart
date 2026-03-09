part of '../../sections/project_details_page.dart';

class _RoleText extends StatelessWidget {
  final String roleText;
  final TextAlign align;

  const _RoleText({required this.roleText, required this.align});

  @override
  Widget build(BuildContext context) {
    final lines = roleText
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();

    return Column(
      crossAxisAlignment:
          align == TextAlign.center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: lines
          .map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                line.trim(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      height: 1.5,
                    ),
                textAlign: align,
              ),
            ),
          )
          .toList(),
    );
  }
}
