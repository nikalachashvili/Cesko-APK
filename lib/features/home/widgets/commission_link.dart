import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Plain text link at the bottom of the administration card
/// (district / precinct commissions).
class CommissionLink extends StatelessWidget {
  const CommissionLink({
    super.key,
    required this.title,
    required this.verticalPadding,
    required this.onTap,
  });

  final String title;
  final double verticalPadding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, verticalPadding, 8, verticalPadding),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
