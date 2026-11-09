import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Logo + name row inside the administration card.
class InstitutionTile extends StatelessWidget {
  const InstitutionTile({
    super.key,
    required this.logo,
    required this.title,
    required this.verticalPadding,
    required this.onTap,
  });

  /// Asset path of the institution's logo.
  final String logo;
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
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: verticalPadding,
          ),
          child: Row(
            children: [
              Image.asset(
                logo,
                width: 58,
                height: 58,
                fit: BoxFit.contain,
                excludeFromSemantics: true,
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
