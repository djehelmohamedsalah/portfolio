import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DevelopmentLineSection extends StatelessWidget {
  const DevelopmentLineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: SvgPicture.asset(
          'lib/assets/photos/tools_icons/development_line.svg',
          fit: BoxFit.contain,
          // We can color the SVG if it's a monochromatic line to match the theme
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurface.withValues(alpha: 0.7),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
