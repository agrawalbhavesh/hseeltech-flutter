import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hseel_colors.dart';
import 'hseel_typography.dart';

/// Hseeltech Theme Configuration
/// Provides complete ThemeData for light and dark modes.
class HseelTheme {
  HseelTheme._();

  // ═══════════════════════════════════════
  // LIGHT THEME
  // ═══════════════════════════════════════

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: HseelTypography.fontFamily,

        // Colors
        colorScheme: const ColorScheme.light(
          primary: HseelColors.primary,
          onPrimary: HseelColors.white,
          primaryContainer: HseelColors.primaryPale,
          onPrimaryContainer: HseelColors.primary,
          secondary: HseelColors.navy,
          onSecondary: HseelColors.white,
          surface: HseelColors.lightSurface,
          onSurface: HseelColors.lightTextPrimary,
          error: HseelColors.error,
          onError: HseelColors.white,
          outline: HseelColors.lightBorder,
        ),
        scaffoldBackgroundColor: HseelColors.lightBackground,
        dividerColor: HseelColors.lightDivider,

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: HseelColors.white,
          foregroundColor: HseelColors.gray900,
          elevation: 0,
          scrolledUnderElevation: 0.5,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: HseelTypography.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: HseelColors.gray900,
          ),
          iconTheme: IconThemeData(color: HseelColors.gray900, size: 24),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),

        // Bottom Navigation
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: HseelColors.white,
          selectedItemColor: HseelColors.primary,
          unselectedItemColor: HseelColors.gray400,
          selectedLabelStyle: HseelTypography.tab,
          unselectedLabelStyle: HseelTypography.tab,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),

        // Cards
        cardTheme: CardThemeData(
          color: HseelColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: HseelColors.lightBorder, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),

        // Elevated Button (Primary CTA)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: HseelColors.primary,
            foregroundColor: HseelColors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: HseelTypography.button,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),

        // Outlined Button
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: HseelColors.primary,
            side: const BorderSide(color: HseelColors.primary, width: 1.5),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: HseelTypography.button,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),

        // Text Button
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: HseelColors.primary,
            textStyle: HseelTypography.button,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),

        // Input Fields
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: HseelColors.gray50,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.gray200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.gray200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.error),
          ),
          labelStyle: HseelTypography.inputLabel,
          hintStyle: HseelTypography.body.copyWith(color: HseelColors.gray400),
          errorStyle: HseelTypography.bodySmall.copyWith(color: HseelColors.error),
        ),

        // Bottom Sheet
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: HseelColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          dragHandleColor: HseelColors.gray300,
          dragHandleSize: Size(40, 4),
          showDragHandle: true,
        ),

        // Dialog
        dialogTheme: DialogThemeData(
          backgroundColor: HseelColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          titleTextStyle: HseelTypography.h4,
          contentTextStyle: HseelTypography.body,
        ),

        // Chip
        chipTheme: ChipThemeData(
          backgroundColor: HseelColors.gray100,
          selectedColor: HseelColors.primaryPale,
          labelStyle: HseelTypography.caption,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),

        // Divider
        dividerTheme: const DividerThemeData(
          color: HseelColors.lightDivider,
          thickness: 1,
          space: 1,
        ),

        // SnackBar
        snackBarTheme: SnackBarThemeData(
          backgroundColor: HseelColors.gray900,
          contentTextStyle: HseelTypography.body.copyWith(color: HseelColors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

  // ═══════════════════════════════════════
  // DARK THEME
  // ═══════════════════════════════════════

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: HseelTypography.fontFamily,

        colorScheme: const ColorScheme.dark(
          primary: HseelColors.primaryLight,
          onPrimary: HseelColors.navy,
          primaryContainer: HseelColors.navyMedium,
          onPrimaryContainer: HseelColors.primaryLight,
          secondary: HseelColors.gray300,
          onSecondary: HseelColors.navy,
          surface: HseelColors.darkSurface,
          onSurface: HseelColors.darkTextPrimary,
          error: HseelColors.error,
          onError: HseelColors.white,
          outline: HseelColors.darkBorder,
        ),
        scaffoldBackgroundColor: HseelColors.darkBackground,
        dividerColor: HseelColors.darkDivider,

        appBarTheme: const AppBarTheme(
          backgroundColor: HseelColors.darkBackground,
          foregroundColor: HseelColors.darkTextPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: HseelTypography.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: HseelColors.darkTextPrimary,
          ),
          iconTheme: IconThemeData(color: HseelColors.darkTextPrimary, size: 24),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: HseelColors.darkSurface,
          selectedItemColor: HseelColors.primaryLight,
          unselectedItemColor: HseelColors.gray500,
          selectedLabelStyle: HseelTypography.tab,
          unselectedLabelStyle: HseelTypography.tab,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),

        cardTheme: CardThemeData(
          color: HseelColors.darkCard,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: HseelColors.darkBorder, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: HseelColors.primaryLight,
            foregroundColor: HseelColors.navy,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: HseelTypography.button,
            minimumSize: const Size(double.infinity, 48),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: HseelColors.darkSurface,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.darkBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.darkBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: HseelColors.primaryLight, width: 2),
          ),
          labelStyle: HseelTypography.inputLabel.copyWith(color: HseelColors.darkTextSecondary),
          hintStyle: HseelTypography.body.copyWith(color: HseelColors.gray500),
        ),

        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: HseelColors.darkSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          dragHandleColor: HseelColors.gray500,
          dragHandleSize: Size(40, 4),
          showDragHandle: true,
        ),
      );
}
