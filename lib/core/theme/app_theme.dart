import 'package:flutter/material.dart';
import 'package:voters/core/theme/app_colors.dart';

ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(seedColor: AppColors.green)
      .copyWith(primary: AppColors.green, onPrimary: Colors.white);

  return ThemeData(
    colorScheme: scheme,
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(54),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        // Label style is left to the theme default (M3 labelLarge: 14 / w500)
        // so it keeps the app's font family.
      ),
    ),
  );
}
