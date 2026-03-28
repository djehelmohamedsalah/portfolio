import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mo_salah_dev/core/localization/strings_provider.dart';
import 'resume/about_action_button.dart';

class AboutActions extends StatelessWidget {
  const AboutActions({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<StringsProvider>().strings;
    const double mobileWidth = 240;
    const double desktopWidth = 280;
    const double mobileHeight = 48;
    const double desktopHeight = 56;
    final bool isMobile =
        MediaQuery.maybeSizeOf(context)?.width != null &&
            MediaQuery.sizeOf(context).width < 640;

    if (isMobile) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: mobileWidth,
            height: mobileHeight,
            child: AboutActionButton(
              label: strings.linkedInButton,
              primaryUrl: strings.linkedInUrl,
              isMobile: true,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: mobileWidth,
            child: AboutActionButton(
              label: strings.resumeButton,
              primaryUrl: strings.resumeUrl,
              isMobile: true,
              showDownload: true,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: desktopWidth,
            height: desktopHeight,
            child: AboutActionButton(
              label: strings.linkedInButton,
              primaryUrl: strings.linkedInUrl,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            width: desktopWidth,
            child: AboutActionButton(
              label: strings.resumeButton,
              primaryUrl: strings.resumeUrl,
              showDownload: true,
            ),
          ),
        ),
      ],
    );
  }
}
