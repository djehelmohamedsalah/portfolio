import 'package:flutter/material.dart';
import 'app_layout.dart';

extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  AppLayout get layout => AppLayout.fromWidth(width);

  bool get isDesktop => width >= Breakpoints.desktop;

  bool get isTablet =>
      width >= Breakpoints.tablet && width < Breakpoints.desktop;

  bool get isMobile => width < Breakpoints.tablet;
}
