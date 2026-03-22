import 'dart:math';

enum DeviceType { mobile, tablet, desktop }

class Breakpoints {
  /// Desktop layouts and full navigation start at this width.
  static const double desktop = 900;

  /// Tablet layouts start here; below is considered mobile.
  static const double tablet = 400;
}

class AppSpacing {
  static const double sectionGap = 80.0;
  static const double blockGap = 40.0;
  static const double itemGap = 12.0;
}

/// Centralized layout description derived from viewport width.
class AppLayout {
  final double width;

  const AppLayout._(this.width);

  factory AppLayout.fromWidth(double width) => AppLayout._(width);

  DeviceType get deviceType {
    if (width >= Breakpoints.desktop) return DeviceType.desktop;
    if (width >= Breakpoints.tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;

  int get gridColumns {
    if (isDesktop) return 4;
    if (isTablet) return 2;
    return 1;
  }

  double get horizontalPadding {
    if (isDesktop) return 72;
    if (isTablet) return 40;
    return 20;
  }

  /// Maximum width the content should occupy on very wide screens.
  double get maxContentWidth => 1200;

  double get constrainedContentWidth =>
      min(maxContentWidth, width - (horizontalPadding * 2));

  double get sectionSpacing => AppSpacing.sectionGap;
  double get blockSpacing => AppSpacing.blockGap;
  double get itemSpacing => AppSpacing.itemGap;
}
