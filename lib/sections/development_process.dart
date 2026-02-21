import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mo_salah_dev/widgets/section_header.dart';
import 'package:mo_salah_dev/widgets/section_container.dart';
import '../constants/app_strings.dart';
import '../utils/responsive_layout.dart';

class DevelopmentProcess extends StatelessWidget {
  final GlobalKey sectionKey;
  const DevelopmentProcess({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    final descriptionStyle = theme.textTheme.bodyLarge?.copyWith(
      height: 1.8,
      fontSize: isMobile ? 16 : 18,
      color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
    );

    final boldStyle = descriptionStyle?.copyWith(
      fontWeight: FontWeight.w900,
      color: theme.colorScheme.onSurface,
    );

    return SectionContainer(
      key: sectionKey,
      titleCentered: true,
      color: theme.colorScheme.surface.withValues(alpha: 0.35),
      height: 600,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionHeader(
                title: AppStrings.developmentProcessTitle,
                subtitle: AppStrings.developmentProcessSubtitle,
              ),
              const SizedBox(height: 48),
              // Section Description Text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: descriptionStyle,
                  children: _buildTextSpans(
                    AppStrings.developmentProcessDescription,
                    boldStyle,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              // Image
              SvgPicture.asset(
                'lib/assets/photos/tools_icons/development_line.svg',
                fit: BoxFit.contain,
                height: isMobile
                    ? 80
                    : 160, // Explicit height to fix layout issues
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Parses text with **bold** markers into a list of TextSpans
  List<TextSpan> _buildTextSpans(String text, TextStyle? boldStyle) {
    final List<TextSpan> spans = [];
    final RegExp regExp = RegExp(r'\*\*(.*?)\*\*');
    int lastMatchEnd = 0;

    for (final Match match in regExp.allMatches(text)) {
      // Add text before the match
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }
      // Add the bolded text (match group 1)
      spans.add(TextSpan(text: match.group(1), style: boldStyle));
      lastMatchEnd = match.end;
    }

    // Add remaining text after the last match
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return spans;
  }
}
