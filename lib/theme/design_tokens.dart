// ============================================
// Hseeltech Design Tokens - Flutter
// Copy this file to: lib/theme/design_tokens.dart
// ============================================

import 'package:flutter/material.dart';

class HseelColors {
  // Brand Navy
  static const Color navy = Color(0xFF1B2A4A);
  static const Color navyLight = Color(0xFF243B5E);
  static const Color navyMuted = Color(0xFF3D5A80);

  // Brand Green
  static const Color greenPrimary = Color(0xFF2D6A4F);
  static const Color greenDark = Color(0xFF0C6B3E);
  static const Color greenMedium = Color(0xFF40916C);
  static const Color greenLight = Color(0xFF10B981);
  static const Color greenBright = Color(0xFF22C55E);
  static const Color greenBgLight = Color(0xFFDCFCE7);
  static const Color greenBgPale = Color(0xFFECFDF5);

  // Neutral
  static const Color textPrimary = Color(0xFF1B1B1B);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color textPlaceholder = Color(0xFF9CA3AF);
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFD1D5DB);
  static const Color bgLight = Color(0xFFF1F5F9);
  static const Color bgLighter = Color(0xFFF8FAFC);
  static const Color white = Color(0xFFFFFFFF);

  // Status
  static const Color error = Color(0xFFEF4444);
  static const Color errorDark = Color(0xFFDC2626);
  static const Color errorBg = Color(0xFFFEE2E2);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningDark = Color(0xFFD4A017);
  static const Color warningBg = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoBg = Color(0xFFBFDBFE);
  static const Color orange = Color(0xFFEA580C);
  static const Color orangeBg = Color(0xFFFFF7ED);

  // Gradients
  static const LinearGradient navyGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1B2A4A), Color(0xFF243B5E), Color(0xFF2E5090)],
  );

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2D6A4F), Color(0xFF40916C)],
  );
}

class HseelTypography {
  static const String fontFamily = 'MontserratArabic';

  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.bold, color: HseelColors.navy,
  );
  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.bold, color: HseelColors.navy,
  );
  static const TextStyle heading3 = TextStyle(
    fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.w600, color: HseelColors.textDark,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600, color: HseelColors.textSecondary,
  );
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w400, color: HseelColors.textPrimary,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.w400, color: HseelColors.textMuted,
  );
  static const TextStyle small = TextStyle(
    fontFamily: fontFamily, fontSize: 10, fontWeight: FontWeight.w400, color: HseelColors.textMuted,
  );
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.w600, color: HseelColors.white,
  );
}

class HseelSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double base = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 40;
}

class HseelRadius {
  static const double sm = 6;
  static const double md = 8;
  static const double base = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double full = 9999;
}

class HseelShadows {
  static List<BoxShadow> sm = [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 1))];
  static List<BoxShadow> md = [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))];
  static List<BoxShadow> lg = [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 16, offset: const Offset(0, 4))];
  static List<BoxShadow> xl = [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 32, offset: const Offset(0, 8))];
}
