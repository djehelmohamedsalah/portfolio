import 'package:flutter/material.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/contact_section.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const PortfolioMainPage(),
    );
  }
}

class PortfolioMainPage extends StatefulWidget {
  const PortfolioMainPage({super.key});

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
      appBar: AppBar(
        title: const Text(
          AppStrings.portfolioTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        actions: [
          _NavBarItem(
            title: AppStrings.navHome,
            onTap: () => _scrollToSection(_homeKey),
          ),
          _NavBarItem(
            title: AppStrings.navProjects,
            onTap: () => _scrollToSection(_projectsKey),
          ),
          _NavBarItem(
            title: AppStrings.navAbout,
            onTap: () => _scrollToSection(_aboutKey),
          ),
          _NavBarItem(
            title: AppStrings.navSkills,
            onTap: () => _scrollToSection(_skillsKey),
          ),
          _NavBarItem(
            title: AppStrings.navContact,
            onTap: () => _scrollToSection(_contactKey),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HomeSection(
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

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
