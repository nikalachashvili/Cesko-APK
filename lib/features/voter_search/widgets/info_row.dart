import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Label on the left, value right-aligned on the same line.
class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(color: AppColors.fieldIcon, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
