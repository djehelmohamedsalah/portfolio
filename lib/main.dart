import 'package:flutter/material.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/contact_section.dart';

import 'constants/app_strings.dart';
import 'theme/app_theme.dart';
import 'widgets/floating_top_app_bar.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        // If system, check current brightness and toggle to opposite
        final brightness = View.of(
          context,
        ).platformDispatcher.platformBrightness;
        _themeMode = brightness == Brightness.dark
            ? ThemeMode.light
            : ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: PortfolioMainPage(onThemeToggle: _toggleTheme),
    );
  }
}

class PortfolioMainPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const PortfolioMainPage({super.key, required this.onThemeToggle});

  @override
  State<PortfolioMainPage> createState() => _PortfolioMainPageState();
}

class _PortfolioMainPageState extends State<PortfolioMainPage> {
  // Scroll Controller to handle scrolling
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys for each section to calculate positions
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Function to scroll to a specific section
  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingTopAppBar(
        onHome: () => _scrollToSection(_homeKey),
        onProjects: () => _scrollToSection(_projectsKey),
        onAbout: () => _scrollToSection(_aboutKey),
        onSkills: () => _scrollToSection(_skillsKey),
        onContact: () => _scrollToSection(_contactKey),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HomeSection(
              onHireMe: () => _scrollToSection(_contactKey),
              sectionKey: _homeKey,
              onViewWork: () => _scrollToSection(_projectsKey),
            ),
            ProjectsSection(sectionKey: _projectsKey),
            AboutSection(sectionKey: _aboutKey),
            SkillsSection(sectionKey: _skillsKey),
            ContactSection(sectionKey: _contactKey),
            const SizedBox(height: 50), // Footer padding
          ],
        ),
      ),
    );
  }
}
