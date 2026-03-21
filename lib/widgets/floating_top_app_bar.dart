import 'package:flutter/material.dart';
import 'package:mo_salah_dev/constants/app_strings.dart';
import '../constants/app_layout.dart';
import 'floating_top_app_bar/header_actions.dart';
import 'floating_top_app_bar/logo_title.dart';
import 'floating_top_app_bar/nav_button.dart';
import 'floating_top_app_bar/nav_action.dart';
import 'floating_top_app_bar/action_icon_button.dart';

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
              final layout = AppLayout.fromWidth(constraints.maxWidth);
              final isDesktop = layout.isDesktop;
              final isMobile = layout.isMobile;
              return Row(
                children: [
                  ResponsiveLogo(onTap: onHome),
                  if (isDesktop) ...[
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              NavButton(
                                label: AppStrings.aboutLabel,
                                onTap: onAbout,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: AppStrings.devProcesLabel,
                                onTap: onDevelopmentProcess,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: AppStrings.skillsLabel,
                                onTap: onSkills,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: AppStrings.projectsLabel,
                                onTap: onProjects,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: AppStrings.contactLabel,
                                onTap: onContact,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    HeaderActions(
                      onThemeToggle: onThemeToggle,
                      onLanguageSelected: onLanguageSelected,
                      currentLanguage: currentLanguage,
                    ),
                  ] else ...[
                    const Spacer(),

                    HeaderActions(
                      onThemeToggle: onThemeToggle,
                      onLanguageSelected: onLanguageSelected,
                      currentLanguage: currentLanguage,
                      iconSizeOverride: isMobile ? 18 : null,
                      spacingOverride: isMobile ? 6 : null,
                    ),
                    SizedBox(width: isMobile ? 6 : 10),
                    _NavMenuButton(
                      iconSize: isMobile ? 22 : null,
                      onSelected: (action) {
                        switch (action) {
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

class _NavMenuButton extends StatelessWidget {
  final ValueChanged<NavAction> onSelected;
  final double? iconSize;

  const _NavMenuButton({required this.onSelected, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return ActionIconButton.menu(
      tooltip: AppStrings.navigatetooltip,
      icon: Icons.menu_rounded,
      iconSize: iconSize,
      splashRadius: iconSize != null ? iconSize! + 6 : null,
      menu: PopupMenuButton<String>(
        tooltip: AppStrings.navigatetooltip,
        onSelected: (value) {
          final action = NavAction.values.firstWhere(
            (a) => a.name == value,
            orElse: () => NavAction.home,
          );
          onSelected(action);
        },
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'about', child: Text(AppStrings.aboutLabel)),
          PopupMenuItem(
            value: 'developmentProcess',
            child: Text(AppStrings.devProcesLabel),
          ),
          PopupMenuItem(value: 'skills', child: Text(AppStrings.skillsLabel)),
          PopupMenuItem(
            value: 'projects',
            child: Text(AppStrings.projectsLabel),
          ),
          PopupMenuItem(value: 'contact', child: Text(AppStrings.contactLabel)),
        ],
      ),
    );
  }
}
