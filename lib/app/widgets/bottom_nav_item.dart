import 'package:flutter/material.dart';

/// One equally-wide, tappable slot in the bottom navigation bar. Must be a
/// direct child of a [Row] because it returns an [Expanded].
class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.child,
  });

  /// Screen-reader label for the tab.
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        excludeSemantics: true,
        child: InkResponse(
          onTap: onTap,
          radius: 32,
          child: Center(child: child),
        ),
      ),
    );
  }
}
