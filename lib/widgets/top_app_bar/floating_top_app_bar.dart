import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/localization/strings_provider.dart';
import 'package:mo_salah_dev/widgets/top_app_bar/nav_menu_button.dart';
import '../../utils/app_layout.dart';
import '../floating_top_app_bar/header_actions.dart';
import '../floating_top_app_bar/logo_title.dart';
import '../floating_top_app_bar/nav_button.dart';
import '../floating_top_app_bar/nav_action.dart';

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
    final strings = context.watch<StringsProvider>().strings;

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
              final isTablet = layout.isTablet;
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
                                label: strings.aboutLabel,
                                onTap: onAbout,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: strings.devProcesLabel,
                                onTap: onDevelopmentProcess,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: strings.skillsLabel,
                                onTap: onSkills,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: strings.projectsLabel,
                                onTap: onProjects,
                              ),
                              const SizedBox(width: 12),
                              NavButton(
                                label: strings.contactLabel,
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
                      iconSizeOverride: isMobile ? 18 : (isTablet ? 20 : null),
                      spacingOverride: isMobile ? 6 : (isTablet ? 8 : null),
                    ),
                    SizedBox(width: isMobile ? 0 : (isTablet ? 8 : 10)),
                    NavMenuButton(
                      iconSize: isMobile ? 22 : (isTablet ? 24 : null),
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
