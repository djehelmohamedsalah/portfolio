import 'package:flutter/material.dart';
import 'floating_top_app_bar/header_actions.dart';
import 'floating_top_app_bar/logo_title.dart';
import 'floating_top_app_bar/nav_button.dart';
import 'floating_top_app_bar/social_button.dart';
import 'floating_top_app_bar/compact_nav_chip.dart';
import 'floating_top_app_bar/nav_action.dart';

class FloatingTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHome;
  final VoidCallback onProjects;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onContact;
  final VoidCallback onThemeToggle;
  final ValueChanged<String>? onLanguageSelected;
  final String currentLanguage;
  final VoidCallback onDevelopmentProcess;

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
    required this.onDevelopmentProcess,
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
                  const LogoTitle(),
                  if (!isCompact)
                    Expanded(
                      child: Center(
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 4,
                          children: [
                            NavButton(label: 'Home', onTap: onHome),
                            NavButton(label: 'About', onTap: onAbout),
                            NavButton(label: 'Projects', onTap: onProjects),
                            NavButton(
                              label: 'Dev Process',
                              onTap: onDevelopmentProcess,
                            ),
                            NavButton(label: 'Skills', onTap: onSkills),
                            NavButton(label: 'Contact', onTap: onContact),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: PopupMenuButton<NavAction>(
                          tooltip: 'Navigate',
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: NavAction.home,
                              child: Text('Home'),
                            ),
                            PopupMenuItem(
                              value: NavAction.about,
                              child: Text('About'),
                            ),
                            PopupMenuItem(
                              value: NavAction.projects,
                              child: Text('Projects'),
                            ),
                            PopupMenuItem(
                              value: NavAction.developmentProcess,
                              child: Text('Dev Process'),
                            ),
                            PopupMenuItem(
                              value: NavAction.skills,
                              child: Text('Skills'),
                            ),
                            PopupMenuItem(
                              value: NavAction.contact,
                              child: Text('Contact'),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case NavAction.home:
                                onHome();
                                break;
                              case NavAction.projects:
                                onProjects();
                                break;
                              case NavAction.about:
                                onAbout();
                                break;
                              case NavAction.developmentProcess:
                                onDevelopmentProcess();
                                break;
                              case NavAction.skills:
                                onSkills();
                                break;
                              case NavAction.contact:
                                onContact();
                                break;
                            }
                          },
                          child: const CompactNavChip(),
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  HeaderActions(
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
                        SocialButton(label: 'Facebook', icon: Icons.facebook),
                        SocialButton(
                          label: 'Instagram',
                          icon: Icons.camera_alt_outlined,
                        ),
                        SocialButton(label: 'LinkedIn', icon: Icons.link),
                        SocialButton(label: 'GitHub', icon: Icons.code),
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
