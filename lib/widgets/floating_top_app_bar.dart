import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import 'floating_top_app_bar/header_actions.dart';
import 'floating_top_app_bar/logo_title.dart';
import 'floating_top_app_bar/nav_button.dart';
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
                  LogoTitle(onTap: onHome),
                  if (!isCompact)
                    Expanded(
                      child: Center(
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 4,
                          children: [
                            NavButton(
                              label: AppStrings.aboutLabel,
                              onTap: onAbout,
                            ),
                            NavButton(
                              label: AppStrings.devProcesLabel,
                              onTap: onDevelopmentProcess,
                            ),
                            NavButton(
                              label: AppStrings.skillsLabel,
                              onTap: onSkills,
                            ),
                            NavButton(
                              label: AppStrings.projectsLabel,
                              onTap: onProjects,
                            ),
                            NavButton(
                              label: AppStrings.contactLabel,
                              onTap: onContact,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: PopupMenuButton<NavAction>(
                          tooltip: AppStrings.navigatetooltip,
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: NavAction.about,
                              child: Text(AppStrings.aboutLabel),
                            ),
                            PopupMenuItem(
                              value: NavAction.developmentProcess,
                              child: Text(AppStrings.devProcesLabel),
                            ),
                            PopupMenuItem(
                              value: NavAction.skills,
                              child: Text(AppStrings.skillsLabel),
                            ),
                            PopupMenuItem(
                              value: NavAction.projects,
                              child: Text(AppStrings.projectsLabel),
                            ),
                            PopupMenuItem(
                              value: NavAction.contact,
                              child: Text(AppStrings.contactLabel),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case NavAction.home:
                                onHome();
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
                              case NavAction.projects:
                                onProjects();
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
