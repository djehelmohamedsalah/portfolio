import 'package:flutter/material.dart';

import 'services/preload_service.dart';
import 'widgets/splash_screen.dart';

/// Root controller that holds the splash until fonts and assets are ready.
class AppBootstrapper extends StatefulWidget {
  final Widget portfolio;

  const AppBootstrapper({super.key, required this.portfolio});

  @override
  State<AppBootstrapper> createState() => _AppBootstrapperState();
}

class _AppBootstrapperState extends State<AppBootstrapper> {
  final PreloadService _preloadService = PreloadService();
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap() async {
    await _preloadService.warmUp(context);
    if (mounted) {
      setState(() => _isReady = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 520),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (currentChild, previousChildren) => Stack(
        fit: StackFit.expand,
        children: [
          ...previousChildren,
          if (currentChild != null) currentChild,
        ],
      ),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: _isReady ? widget.portfolio : const SplashScreen(),
    );
  }
}
