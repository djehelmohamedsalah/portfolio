class Breakpoints {
  static const double desktop = 1200;
  static const double tablet = 800;
}

int getGridColumns(double width) {
  if (width >= Breakpoints.desktop) return 4;
  if (width >= Breakpoints.tablet) return 2;
  return 1;
}

class AppSpacing {
  static const double sectionGap = 80.0;
  static const double blockGap = 40.0;
  static const double itemGap = 12.0;
}
