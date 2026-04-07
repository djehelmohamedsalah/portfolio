part of '../../sections/project_details_page.dart';

class ProjectScreenshotImage extends StatefulWidget {
  final String assetPath;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const ProjectScreenshotImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
  });

  @override
  State<ProjectScreenshotImage> createState() => _ProjectScreenshotImageState();
}

class _ProjectScreenshotImageState extends State<ProjectScreenshotImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;
  late final Animation<double> _slideAnimation;
  bool _isLoaded = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _slideAnimation = Tween<double>(begin: -1.2, end: 1.2).animate(
      CurvedAnimation(
        parent: _shimmerController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  void _markLoaded() {
    if (_isLoaded) return;
    setState(() {
      _isLoaded = true;
    });
    _shimmerController.stop();
  }

  void _markError() {
    if (_hasError) return;
    setState(() {
      _hasError = true;
      _isLoaded = true;
    });
    _shimmerController.stop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseColor = isDark
        ? Colors.white.withValues(alpha: 0.06)
        : Colors.black.withValues(alpha: 0.05);
    final highlightColor = isDark
        ? Colors.white.withValues(alpha: 0.12)
        : Colors.white.withValues(alpha: 0.16);

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            opacity: _isLoaded ? 0 : 1,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            child: RepaintBoundary(
              child: _ShimmerSurface(
                animation: _slideAnimation,
                baseColor: baseColor,
                highlightColor: highlightColor,
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _isLoaded ? 1 : 0,
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            child: Image.asset(
              widget.assetPath,
              fit: widget.fit,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (!_isLoaded &&
                    (wasSynchronouslyLoaded || frame != null)) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) _markLoaded();
                  });
                }
                return child;
              },
              errorBuilder: (context, error, stackTrace) {
                if (!_hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) _markError();
                  });
                }
                return _ErrorPlaceholder(
                  iconColor: theme.disabledColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerSurface extends StatelessWidget {
  final Animation<double> animation;
  final Color baseColor;
  final Color highlightColor;

  const _ShimmerSurface({
    required this.animation,
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final slide = animation.value;
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0 + slide, -0.1),
              end: Alignment(1.0 + slide, 0.1),
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: const [0.25, 0.5, 0.75],
            ),
          ),
        );
      },
    );
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  final Color iconColor;

  const _ErrorPlaceholder({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.broken_image,
        size: 50,
        color: iconColor,
      ),
    );
  }
}
