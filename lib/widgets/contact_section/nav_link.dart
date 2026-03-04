part of '../../sections/contact_section.dart';

class _NavLink extends StatefulWidget {
  final String label;
  final GlobalKey? targetKey;

  const _NavLink({required this.label, required this.targetKey});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: widget.targetKey != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () => _scrollTo(context, widget.targetKey),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 160),
          opacity: _hover ? 1.0 : 0.78,
          child: Text(
            widget.label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _scrollTo(BuildContext context, GlobalKey? key) async {
    if (key?.currentContext == null) return;
    await Scrollable.ensureVisible(
      key!.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }
}
