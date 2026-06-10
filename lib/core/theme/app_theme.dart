import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      indicatorColor: AppColors.primary.withValues(alpha: 0.45),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    fontFamily: AppTextStyles.fontFamily,
    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.gold,
      surface: AppColors.surface,
      error: AppColors.error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: AppTextStyles.h3,
    ),

    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: AppTextStyles.button,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.gold,
      foregroundColor: Colors.black,
      elevation: 4,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primaryLight,
      selectedColor: AppColors.primary,
      labelStyle: AppTextStyles.bodySmall,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearTrackColor: AppColors.surfaceAlt,
    ),
  );
}
