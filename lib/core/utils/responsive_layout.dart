import 'package:flutter/material.dart';
import 'app_layout.dart';

typedef ResponsiveLayoutBuilder = Widget Function(
  BuildContext context,
  AppLayout layout,
);

class ResponsiveLayout extends StatelessWidget {
  final ResponsiveLayoutBuilder builder;

  const ResponsiveLayout({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = AppLayout.fromWidth(constraints.maxWidth);
        return _LayoutScope(
          layout: layout,
          child: builder(context, layout),
        );
      },
    );
  }
}

class _LayoutScope extends InheritedWidget {
  final AppLayout layout;

  const _LayoutScope({
    required this.layout,
    required super.child,
  });

  static AppLayout of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<_LayoutScope>();
    assert(
      scope != null,
      'No ResponsiveLayout found in context. Wrap your widget tree with ResponsiveLayout.',
    );
    return scope!.layout;
  }

  @override
  bool updateShouldNotify(covariant _LayoutScope oldWidget) =>
      oldWidget.layout.width != layout.width;
}

extension LayoutContext on BuildContext {
  AppLayout get layout => _LayoutScope.of(this);
}
