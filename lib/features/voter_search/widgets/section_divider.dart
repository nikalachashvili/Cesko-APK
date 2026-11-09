import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 28, thickness: 1, color: AppColors.divider);
  }
}
