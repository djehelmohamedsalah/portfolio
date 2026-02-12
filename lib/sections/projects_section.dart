import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/project.dart';
import '../utils/responsive_layout.dart';
import 'project_details_page.dart';

enum ProjectVisualStyle { imageBased, orbitBased }

class ProjectCaseStudyConfig {
  final Project project;
  final ProjectVisualStyle style;
  final List<Color> gradientColors;
  final Alignment gradientStart;
  final Alignment gradientEnd;

  const ProjectCaseStudyConfig({
    required this.project,
    required this.style,
    this.gradientColors = const [],
    this.gradientStart = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
  });
}

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final projects = Project.allProjects;
    final caseStudies = [
      ProjectCaseStudyConfig(
        project: projects[0],
        style: ProjectVisualStyle.imageBased,
      ),
      if (projects.length > 1)
        ProjectCaseStudyConfig(
          project: projects[1],
          style: ProjectVisualStyle.imageBased,
        ),
      if (projects.length > 2)
        ProjectCaseStudyConfig(
          project: projects[2],
          style: ProjectVisualStyle.orbitBased,
          gradientColors: const [
            Color(0xFF0D1B3D),
            Color(0xFF0A3D62),
            Color(0xFF00BFA6),
          ],
          gradientStart: Alignment.topLeft,
          gradientEnd: Alignment.bottomRight,
        ),
    ];

    return Column(
      key: sectionKey,
      children: caseStudies.map((config) {
        return _CaseStudySection(config: config);
      }).toList(),
    );
  }
}

class _CaseStudySection extends StatelessWidget {
  final ProjectCaseStudyConfig config;

  const _CaseStudySection({required this.config});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = ResponsiveLayout.isMobile(context);
    final minHeight = isMobile ? size.height * 0.75 : size.height * 0.92;
    final verticalPadding = isMobile ? 56.0 : 96.0;
    final horizontalPadding = _horizontalPadding(size.width);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      child: Stack(
        children: [
          Positioned.fill(child: _CaseStudyBackground(config: config)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 900) {
                  return _MobileCaseStudyLayout(config: config);
                }
                return _DesktopCaseStudyLayout(
                  config: config,
                  maxWidth: constraints.maxWidth,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double _horizontalPadding(double width) {
    if (width >= 1440) return 120;
    if (width >= 1100) return 100;
    if (width >= 900) return 80;
    if (width >= 700) return 48;
    return 24;
  }
}

class _CaseStudyBackground extends StatelessWidget {
  final ProjectCaseStudyConfig config;

  const _CaseStudyBackground({required this.config});

  @override
  Widget build(BuildContext context) {
    if (config.style == ProjectVisualStyle.imageBased) {
      final imagePath = config.project.screenshots.isNotEmpty
          ? config.project.screenshots.first
          : config.project.logo;
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.68),
                  Color.fromRGBO(0, 0, 0, 0.58),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: config.gradientColors.isNotEmpty
              ? config.gradientColors
              : const [Color(0xFF0B1024), Color(0xFF0C214A), Color(0xFF00A1A7)],
          center: const Alignment(0.6, -0.2),
          radius: 1.2,
        ),
      ),
    );
  }
}

class _DesktopCaseStudyLayout extends StatelessWidget {
  final ProjectCaseStudyConfig config;
  final double maxWidth;

  const _DesktopCaseStudyLayout({required this.config, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final leftWidth = maxWidth * 0.46;
    final rightWidth = maxWidth * 0.54;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: leftWidth,
          child: _CaseStudyText(config: config),
        ),
        SizedBox(
          width: rightWidth,
          child: Align(
            alignment: Alignment.centerRight,
            child: _CaseStudyVisual(config: config),
          ),
        ),
      ],
    );
  }
}

class _MobileCaseStudyLayout extends StatelessWidget {
  final ProjectCaseStudyConfig config;

  const _MobileCaseStudyLayout({required this.config});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CaseStudyText(config: config),
        const SizedBox(height: 48),
        Center(child: _CaseStudyVisual(config: config)),
      ],
    );
  }
}

class _CaseStudyText extends StatelessWidget {
  final ProjectCaseStudyConfig config;

  const _CaseStudyText({required this.config});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final titleSize = isMobile ? 36.0 : 52.0;
    final bodySize = isMobile ? 15.5 : 17.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CASE STUDY',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            config.project.title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontSize: titleSize,
              height: 1.18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            config.project.overview,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.85),
              fontSize: bodySize,
              height: 1.65,
            ),
          ),
        ),
        const SizedBox(height: 32),
        _HoverOutlineButton(
          label: 'View Case Study',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProjectDetailsPage(project: config.project),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _CaseStudyVisual extends StatelessWidget {
  final ProjectCaseStudyConfig config;

  const _CaseStudyVisual({required this.config});

  @override
  Widget build(BuildContext context) {
    if (config.style == ProjectVisualStyle.imageBased) {
      return _MockupStack(project: config.project);
    }
    return _AutomationOrbit(project: config.project);
  }
}

class _MockupStack extends StatelessWidget {
  final Project project;

  const _MockupStack({required this.project});

  @override
  Widget build(BuildContext context) {
    final screenshots = project.screenshots;
    final tabletImage = screenshots.isNotEmpty ? screenshots[0] : project.logo;
    final phoneImage = screenshots.length > 1 ? screenshots[1] : project.logo;
    final isMobile = ResponsiveLayout.isMobile(context);
    final tabletWidth = isMobile ? 300.0 : 460.0;
    final phoneWidth = isMobile ? 120.0 : 150.0;

    return SizedBox(
      width: tabletWidth + phoneWidth * 0.6,
      height: tabletWidth * 0.75,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: _MockupImage(
              imagePath: tabletImage,
              width: tabletWidth,
              aspectRatio: 4 / 3,
            ),
          ),
          Positioned(
            right: tabletWidth * 0.68,
            top: tabletWidth * 0.12,
            child: _MockupImage(
              imagePath: phoneImage,
              width: phoneWidth,
              aspectRatio: 9 / 19,
            ),
          ),
        ],
      ),
    );
  }
}

class _MockupImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double aspectRatio;

  const _MockupImage({
    required this.imagePath,
    required this.width,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _AutomationOrbit extends StatelessWidget {
  final Project project;

  const _AutomationOrbit({required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final size = isMobile ? 300.0 : 420.0;
    final innerRadius = isMobile ? 90.0 : 120.0;
    final outerRadius = isMobile ? 150.0 : 220.0;

    final iconSet = [
      Icons.analytics_outlined,
      Icons.cloud_done_outlined,
      Icons.hub_outlined,
      Icons.security_outlined,
      Icons.sync_alt_outlined,
      Icons.auto_graph_outlined,
    ];

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _OrbitRing(radius: innerRadius),
          _OrbitRing(radius: outerRadius),
          _OrbitIcons(radius: innerRadius, icons: iconSet.sublist(0, 3)),
          _OrbitIcons(radius: outerRadius, icons: iconSet.sublist(3)),
          CircleAvatar(
            radius: isMobile ? 32 : 40,
            backgroundColor: Colors.white.withOpacity(0.12),
            child: ClipOval(
              child: Image.asset(
                project.logo,
                width: isMobile ? 56 : 70,
                height: isMobile ? 56 : 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrbitRing extends StatelessWidget {
  final double radius;

  const _OrbitRing({required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
    );
  }
}

class _OrbitIcons extends StatelessWidget {
  final double radius;
  final List<IconData> icons;

  const _OrbitIcons({required this.radius, required this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(icons.length, (index) {
          final angle = (2 * math.pi / icons.length) * index;
          final offset = Offset(
            radius * math.cos(angle),
            radius * math.sin(angle),
          );
          return Transform.translate(
            offset: offset,
            child: _OrbitIcon(icon: icons[index]),
          );
        }),
      ),
    );
  }
}

class _OrbitIcon extends StatelessWidget {
  final IconData icon;

  const _OrbitIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.12),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Icon(icon, color: Colors.white.withOpacity(0.9), size: 22),
    );
  }
}

class _HoverOutlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _HoverOutlineButton({required this.label, required this.onTap});

  @override
  State<_HoverOutlineButton> createState() => _HoverOutlineButtonState();
}

class _HoverOutlineButtonState extends State<_HoverOutlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final background = _hovering ? Colors.white : Colors.transparent;
    final foreground = _hovering ? Colors.black : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(999),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
