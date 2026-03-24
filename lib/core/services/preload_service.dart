import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/tool_assets.dart';

/// Handles warming up fonts and critical visual assets before the portfolio renders.
class PreloadService {
  static const Duration minimumSplashDuration = Duration(milliseconds: 2300);

  /// Preloads fonts, raster images, and SVGs, ensuring the first visible frame is stable.
  Future<void> warmUp(BuildContext context) async {
    final stopwatch = Stopwatch()..start();

    await Future.wait([
      _warmFonts(),
      _precacheImages(context),
      _precacheSvgs(context),
    ]);

    final remaining = minimumSplashDuration - stopwatch.elapsed;
    if (!remaining.isNegative) {
      await Future.delayed(remaining);
    }
  }

  Future<void> _warmFonts() async {
    // Pre-resolve the primary text family used across light/dark themes.
    await GoogleFonts.pendingFonts(<TextStyle>[
      GoogleFonts.montserrat(),
      GoogleFonts.montserrat(fontWeight: FontWeight.w600),
      GoogleFonts.montserrat(fontWeight: FontWeight.w700),
    ]);
  }

  Future<void> _precacheImages(BuildContext context) async {
    const heroAndBranding = <String>[
      'lib/core/assets/photos/developper/suit_profile_picture.png',
      'lib/core/assets/photos/developper/avatar.png',
      'lib/core/assets/photos/developper/M_logo.png',
      'lib/core/assets/photos/developper/signature.png',
      'lib/core/assets/photos/developper/cappsulle.png',
    ];

    const projectCovers = <String>[
      'lib/core/assets/photos/newsily/newsily_overview.png',
      'lib/core/assets/photos/raqib/raqib_overvie.png',
      'lib/core/assets/photos/quranLife/quranlife_overview.png',
    ];

    const rasterTooling = <String>[
      'lib/core/assets/photos/tools_icons/sdk.png',
    ];

    final allRaster = <String>[
      ...heroAndBranding,
      ...projectCovers,
      ...rasterTooling,
    ];

    for (final asset in allRaster) {
      await precacheImage(AssetImage(asset), context);
    }
  }

  Future<void> _precacheSvgs(BuildContext context) async {
    const socialSvgs = <String>[
      'lib/core/assets/photos/social_icons/github.svg',
      'lib/core/assets/photos/social_icons/whatsapp.svg',
      'lib/core/assets/photos/social_icons/linkedin.svg',
      'lib/core/assets/photos/social_icons/instagram.svg',
      'lib/core/assets/photos/social_icons/facebook.svg',
    ];

    final toolSvgs = toolAssets
        .where((asset) => asset.isSvg)
        .map((asset) => asset.path);

    final allSvgAssets = <String>[
      ...socialSvgs,
      ...toolSvgs,
      'lib/core/assets/photos/tools_icons/development_line.svg',
    ];

    await Future.wait(
      allSvgAssets.map((svgAsset) async {
        final loader = SvgAssetLoader(svgAsset);
        await svg.cache.putIfAbsent(
          loader.cacheKey(null),
          () => loader.loadBytes(null),
        );
      }),
    );
  }
}
