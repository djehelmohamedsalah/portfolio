import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 18 : 24,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 22,
          vertical: isMobile ? 14 : 18,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.12),
          ),
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel(context),
                  const SizedBox(height: 10),
                  _buildTools(),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _buildLabel(context)),
                  const SizedBox(width: 20),
                  Expanded(flex: 2, child: _buildTools(alignment: WrapAlignment.end)),
                ],
              ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'I work with',
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildTools({WrapAlignment alignment = WrapAlignment.start}) {
    return Wrap(
      alignment: alignment,
      spacing: 10,
      runSpacing: 10,
      children: const [
        _ToolLogo(
          icon: Icons.flutter_dash,
          label: 'Flutter',
          color: Color(0xFF54C5F8),
        ),
        _ToolLogo(
          icon: Icons.data_object_rounded,
          label: 'Dart',
          color: Color(0xFF0175C2),
        ),
        _ToolLogo(
          icon: Icons.local_fire_department_rounded,
          label: 'Firebase',
          color: Color(0xFFFFA000),
        ),
        _ToolLogo(
          icon: Icons.android_rounded,
          label: 'Android',
          color: Color(0xFF3DDC84),
        ),
        _ToolLogo(
          icon: Icons.source_rounded,
          label: 'Git',
          color: Color(0xFFF05032),
        ),
        _ToolLogo(
          icon: Icons.design_services_rounded,
          label: 'Figma',
          color: Color(0xFF2D334A),
        ),
      ],
    );
  }
}

class _ToolLogo extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ToolLogo({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: label,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.12),
          ),
        ),
        child: Icon(icon, size: 22, color: color),
      ),
    );
  }
}
