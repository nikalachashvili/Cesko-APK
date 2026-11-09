import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Green page header that extends under the status bar, with a centred title,
/// an optional [leading] action (e.g. a back button) and an optional widget
/// attached to its bottom edge.
class GreenHeader extends StatelessWidget {
  const GreenHeader({
    super.key,
    required this.title,
    this.leading,
    this.bottom,
  });

  final String title;
  final Widget? leading;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.green,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.paddingOf(context).top),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: leading == null ? 16 : 56,
                  vertical: 26,
                ),
                child: Semantics(
                  header: true,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (leading case final leading?)
                Positioned(left: 4, child: leading),
            ],
          ),
          ?bottom,
        ],
      ),
    );
  }
}
