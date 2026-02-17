import 'package:flutter/material.dart';

/// Hseeltech Design System - Color Tokens
/// All colors used throughout the app MUST reference this class.
/// Never hardcode hex values in widgets.
class HseelColors {
  HseelColors._();

  // ═══════════════════════════════════════
  // BRAND COLORS
  // ═══════════════════════════════════════

  /// Primary green - buttons, CTAs, active states, progress bars
  static const Color primary = Color(0xFF16A34A);

  /// Light green - hover states, secondary accents, success indicators
  static const Color primaryLight = Color(0xFF22C55E);

  /// Pale green - light backgrounds, badges, subtle highlights
  static const Color primaryPale = Color(0xFFDCFCE7);

  /// Extra pale green - very subtle tints
  static const Color primarySurface = Color(0xFFF0FDF4);

  /// Gold - premium features, rewards, special badges
  static const Color gold = Color(0xFFCA8A04);

  /// Light gold - gold badge backgrounds, reward highlights
  static const Color goldLight = Color(0xFFFEF3C7);

  // ═══════════════════════════════════════
  // NEUTRAL COLORS
  // ═══════════════════════════════════════

  /// Navy dark - dark backgrounds, primary text on light
  static const Color navy = Color(0xFF0A1628);

  /// Navy light - dark mode surfaces
  static const Color navyLight = Color(0xFF132240);

  /// Navy medium - dark mode cards, elevated surfaces
  static const Color navyMedium = Color(0xFF1A3058);

  /// Navy border - dark mode borders
  static const Color navyBorder = Color(0xFF1E3A5F);

  // Gray Scale
  static const Color gray900 = Color(0xFF0F172A);
  static const Color gray800 = Color(0xFF1E293B);
  static const Color gray700 = Color(0xFF334155);
  static const Color gray600 = Color(0xFF475569);
  static const Color gray500 = Color(0xFF64748B);
  static const Color gray400 = Color(0xFF94A3B8);
  static const Color gray300 = Color(0xFFCBD5E1);
  static const Color gray200 = Color(0xFFE2E8F0);
  static const Color gray100 = Color(0xFFF1F5F9);
  static const Color gray50 = Color(0xFFF8FAFC);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ═══════════════════════════════════════
  // SEMANTIC COLORS
  // ═══════════════════════════════════════

  /// Success - verified badges, positive returns, completed states
  static const Color success = Color(0xFF22C55E);
  static const Color successLight = Color(0xFFDCFCE7);

  /// Warning - pending states, caution alerts
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);

  /// Error - error messages, negative returns, destructive actions
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);

  /// Info - informational messages, links
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);

  // ═══════════════════════════════════════
  // STATUS BADGE COLORS
  // ═══════════════════════════════════════

  static const Color statusAvailable = Color(0xFF22C55E);
  static const Color statusFunded = Color(0xFF3B82F6);
  static const Color statusComingSoon = Color(0xFFF59E0B);
  static const Color statusProcessing = Color(0xFF8B5CF6);

  // ═══════════════════════════════════════
  // LIGHT THEME
  // ═══════════════════════════════════════

  static const Color lightBackground = Color(0xFFFAFCFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightDivider = Color(0xFFF1F5F9);

  // ═══════════════════════════════════════
  // DARK THEME
  // ═══════════════════════════════════════

  static const Color darkBackground = Color(0xFF0A1628);
  static const Color darkSurface = Color(0xFF132240);
  static const Color darkCard = Color(0xFF1A3058);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkBorder = Color(0xFF1E3A5F);
  static const Color darkDivider = Color(0xFF1E3A5F);

  // ═══════════════════════════════════════
  // GRADIENTS
  // ═══════════════════════════════════════

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF16A34A), Color(0xFF22C55E)],
  );

  static const LinearGradient navyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0A1628), Color(0xFF132240)],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFCA8A04), Color(0xFFEAB308)],
  );

  /// Shimmer gradient for skeleton loading
  static const LinearGradient shimmerGradient = LinearGradient(
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    colors: [
      Color(0xFFE2E8F0),
      Color(0xFFF1F5F9),
      Color(0xFFE2E8F0),
    ],
    stops: [0.0, 0.5, 1.0],
  );
}
