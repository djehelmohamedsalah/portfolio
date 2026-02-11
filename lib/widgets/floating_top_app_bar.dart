import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class FloatingTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHome;
  final VoidCallback onProjects;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onContact;
  final VoidCallback onThemeToggle;
  final ValueChanged<String>? onLanguageSelected;
  final String currentLanguage;

  const FloatingTopAppBar({
    super.key,
    required this.onHome,
    required this.onProjects,
    required this.onAbout,
    required this.onSkills,
    required this.onContact,
    required this.onThemeToggle,
    this.onLanguageSelected,
    this.currentLanguage = 'EN',
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          constraints: const BoxConstraints(maxWidth: 1000),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 760;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _LogoTitle(),
                  if (!isCompact)
                    Expanded(
                      child: Center(
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 4,
                          children: [
                            _NavButton(label: 'Home', onTap: onHome),
                            _NavButton(label: 'Projects', onTap: onProjects),
                            _NavButton(label: 'About', onTap: onAbout),
                            _NavButton(label: 'Skills', onTap: onSkills),
                            _NavButton(label: 'Contact', onTap: onContact),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: PopupMenuButton<_NavAction>(
                          tooltip: 'Navigate',
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: _NavAction.home,
                              child: Text('Home'),
                            ),
                            PopupMenuItem(
                              value: _NavAction.projects,
                              child: Text('Projects'),
                            ),
                            PopupMenuItem(
                              value: _NavAction.about,
                              child: Text('About'),
                            ),
                            PopupMenuItem(
                              value: _NavAction.skills,
                              child: Text('Skills'),
                            ),
                            PopupMenuItem(
                              value: _NavAction.contact,
                              child: Text('Contact'),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case _NavAction.home:
                                onHome();
                                break;
                              case _NavAction.projects:
                                onProjects();
                                break;
                              case _NavAction.about:
                                onAbout();
                                break;
                              case _NavAction.skills:
                                onSkills();
                                break;
                              case _NavAction.contact:
                                onContact();
                                break;
                            }
                          },
                          child: const _CompactNavChip(),
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  _HeaderActions(
                    onThemeToggle: onThemeToggle,
                    onLanguageSelected: onLanguageSelected,
                    currentLanguage: currentLanguage,
                  ),
                  if (!isCompact) ...[
                    const SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 24,
                      color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        _SocialButton(label: 'Facebook', icon: Icons.facebook),
                        _SocialButton(
                          label: 'Instagram',
                          icon: Icons.camera_alt_outlined,
                        ),
                        _SocialButton(label: 'LinkedIn', icon: Icons.link),
                        _SocialButton(label: 'GitHub', icon: Icons.code),
                      ],
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeaderActions extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ValueChanged<String>? onLanguageSelected;
  final String currentLanguage;

  const _HeaderActions({
    required this.onThemeToggle,
    this.onLanguageSelected,
    required this.currentLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ActionIconButton(
          tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
          icon: isDark ? Icons.light_mode : Icons.dark_mode,
          onTap: onThemeToggle,
        ),
        const SizedBox(width: 10),
        _ActionIconButton.menu(
          tooltip: 'Language',
          icon: Icons.language,
          menu: PopupMenuButton<String>(
            tooltip: 'Language',
            initialValue: currentLanguage,
            onSelected: (value) => onLanguageSelected?.call(value),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'EN', child: Text('English')),
              PopupMenuItem(value: 'AR', child: Text('Arabic')),
              PopupMenuItem(value: 'FR', child: Text('French')),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionIconButton extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback? onTap;
  final PopupMenuButton<String>? menu;

  const _ActionIconButton({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  }) : menu = null;

  const _ActionIconButton.menu({
    required this.tooltip,
    required this.icon,
    required this.menu,
  }) : onTap = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (menu != null) {
      return PopupMenuButton<String>(
        tooltip: tooltip,
        initialValue: menu!.initialValue,
        onSelected: menu!.onSelected,
        itemBuilder: menu!.itemBuilder,
        icon: Icon(icon, color: colorScheme.onSurface),
      );
    }

    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      icon: Icon(icon, color: colorScheme.onSurface),
      splashRadius: 20,
    );
  }
}

class _LogoTitle extends StatelessWidget {
  const _LogoTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            "lib/assets/photos/developper/M_logo.png",
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.schortname,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
            Text(
              AppStrings.schortname2,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SocialButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: () {},
      tooltip: label,
      icon: Icon(icon),
      color: theme.colorScheme.onSurface,
      splashRadius: 20,
    );
  }
}

class _CompactNavChip extends StatelessWidget {
  const _CompactNavChip();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.menu, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Text(
            'Sections',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

enum _NavAction { home, projects, about, skills, contact }
