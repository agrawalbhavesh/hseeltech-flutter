/// Hseeltech Design System - Spacing & Dimensions
/// All spacing, radius, and dimension values MUST reference this class.
class HseelSpacing {
  HseelSpacing._();

  // ═══════════════════════════════════════
  // SPACING SCALE
  // ═══════════════════════════════════════

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double xxxxl = 40.0;
  static const double xxxxxl = 48.0;

  // ═══════════════════════════════════════
  // BORDER RADIUS
  // ═══════════════════════════════════════

  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;
  static const double radiusXxl = 20.0;
  static const double radiusFull = 9999.0;

  // ═══════════════════════════════════════
  // SCREEN DIMENSIONS (iPhone 14 Pro)
  // ═══════════════════════════════════════

  static const double designWidth = 390.0;
  static const double designHeight = 844.0;
  static const double safeAreaTop = 59.0;
  static const double safeAreaBottom = 34.0;
  static const double bottomNavHeight = 83.0; // 49 nav + 34 safe area
  static const double statusBarHeight = 54.0;

  // ═══════════════════════════════════════
  // COMPONENT DIMENSIONS
  // ═══════════════════════════════════════

  static const double buttonHeight = 48.0;
  static const double buttonHeightSmall = 36.0;
  static const double inputHeight = 48.0;
  static const double appBarHeight = 56.0;
  static const double cardMinHeight = 80.0;
  static const double iconSize = 24.0;
  static const double iconSizeSmall = 20.0;
  static const double iconSizeLarge = 32.0;
  static const double avatarSize = 40.0;
  static const double avatarSizeLarge = 64.0;
  static const double touchTarget = 44.0; // Minimum touch target (iOS)
  static const double touchTargetAndroid = 48.0;

  // ═══════════════════════════════════════
  // PAGE PADDING
  // ═══════════════════════════════════════

  static const double pagePaddingH = 16.0; // Horizontal page padding
  static const double pagePaddingV = 16.0; // Vertical page padding
  static const double sectionGap = 24.0;   // Gap between sections
  static const double cardPadding = 16.0;  // Internal card padding
}
