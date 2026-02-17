// theme_overrides.dart
// Copy this file to lib/core/theme/ and import in main.dart
// This applies the new Hseeltech design system globally

import 'package:flutter/material.dart';

class HseelTheme {
  // ===== COLORS =====
  static const Color primaryNavy = Color(0xFF1B2A4A);
  static const Color primaryBlue = Color(0xFF2E5090);
  static const Color primaryBlueLight = Color(0xFF4A7BC7);
  static const Color secondaryGreen = Color(0xFF2D6A4F);
  static const Color secondaryGreenLight = Color(0xFF40916C);
  static const Color neutralDark = Color(0xFF1B1B1B);
  static const Color neutralGray = Color(0xFF6B7280);
  static const Color neutralGrayLight = Color(0xFF9CA3AF);
  static const Color neutralBorder = Color(0xFFE2E8F0);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgBluePale = Color(0xFFEDF2F9);
  static const Color bgBlueGhost = Color(0xFFF5F8FC);
  static const Color semanticError = Color(0xFFDC2626);
  static const Color semanticWarning = Color(0xFFF59E0B);
  static const Color semanticSuccess = Color(0xFF10B981);
  static const Color semanticGold = Color(0xFFD4A017);

  // ===== GRADIENTS =====
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1B2A4A), Color(0xFF243B5E)],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment(-0.5, -1),
    end: Alignment(0.5, 1),
    colors: [Color(0xFF1B2A4A), Color(0xFF0F1B2D), Color(0xFF1B2A4A)],
  );

  static const LinearGradient welcomeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0F1B2D), Color(0xFF1B2A4A), Color(0xFF2E5090)],
  );

  static const LinearGradient progressGradient = LinearGradient(
    colors: [Color(0xFF4A7BC7), Color(0xFF2D6A4F)],
  );

  // ===== TYPOGRAPHY =====
  static const String fontFamily = 'MontserratArabic';

  static TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(fontFamily: fontFamily, fontSize: 34, fontWeight: FontWeight.w800, color: neutralDark),
    displayMedium: TextStyle(fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.w800, color: neutralDark),
    displaySmall: TextStyle(fontFamily: fontFamily, fontSize: 22, fontWeight: FontWeight.w700, color: neutralDark),
    headlineLarge: TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: neutralDark),
    headlineMedium: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: neutralDark),
    headlineSmall: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w600, color: neutralDark),
    titleLarge: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600, color: neutralDark),
    titleMedium: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w500, color: neutralDark),
    titleSmall: TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w500, color: neutralGray),
    bodyLarge: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: neutralDark),
    bodyMedium: TextStyle(fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: neutralDark),
    bodySmall: TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w400, color: neutralGray),
    labelLarge: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w700, color: bgWhite),
    labelMedium: TextStyle(fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.w700, color: neutralDark),
    labelSmall: TextStyle(fontFamily: fontFamily, fontSize: 9, fontWeight: FontWeight.w500, color: neutralGrayLight),
  );

  // ===== THEME DATA =====
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      onPrimary: bgWhite,
      secondary: secondaryGreen,
      onSecondary: bgWhite,
      surface: bgWhite,
      onSurface: neutralDark,
      error: semanticError,
      onError: bgWhite,
      outline: neutralBorder,
    ),
    scaffoldBackgroundColor: bgBlueGhost,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: bgWhite,
      ),
      iconTheme: IconThemeData(color: bgWhite),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: bgWhite,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryBlue,
        minimumSize: const Size(double.infinity, 52),
        side: const BorderSide(color: primaryBlue, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: bgWhite,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: neutralBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: neutralBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: semanticError),
      ),
      labelStyle: const TextStyle(fontFamily: fontFamily, color: neutralGray),
      hintStyle: const TextStyle(fontFamily: fontFamily, color: neutralGrayLight),
    ),
    cardTheme: CardTheme(
      color: bgWhite,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: neutralBorder, width: 0.5),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: bgWhite,
      selectedItemColor: primaryBlue,
      unselectedItemColor: neutralGrayLight,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w700),
      unselectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w400),
    ),
    dividerTheme: const DividerThemeData(color: neutralBorder, thickness: 0.5),
    chipTheme: ChipThemeData(
      backgroundColor: bgBluePale,
      selectedColor: primaryNavy,
      labelStyle: const TextStyle(fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
  );

  // ===== BORDER RADIUS =====
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 20;

  // ===== SHADOWS =====
  static List<BoxShadow> get shadowSm => [
    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1)),
  ];
  static List<BoxShadow> get shadowMd => [
    BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 6, offset: const Offset(0, 4)),
  ];
  static List<BoxShadow> get shadowLg => [
    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 10)),
  ];

  // ===== SPACING =====
  static const double spacingXs = 4;
  static const double spacingSm = 8;
  static const double spacingMd = 12;
  static const double spacingLg = 16;
  static const double spacingXl = 20;
  static const double spacing2xl = 24;
}

// ===== USAGE IN main.dart =====
// import 'package:hseeltech/core/theme/theme_overrides.dart';
//
// MaterialApp(
//   theme: HseelTheme.lightTheme,
//   // ... rest of app
// )
