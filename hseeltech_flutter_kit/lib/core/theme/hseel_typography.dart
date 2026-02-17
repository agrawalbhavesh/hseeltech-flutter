import 'package:flutter/material.dart';
import 'hseel_colors.dart';

/// Hseeltech Design System - Typography
/// All text styles MUST reference this class.
/// Never hardcode font sizes or weights in widgets.
class HseelTypography {
  HseelTypography._();

  static const String fontFamily = 'Montserrat Arabic';

  // ═══════════════════════════════════════
  // DISPLAY & HEADINGS
  // ═══════════════════════════════════════

  /// 32px ExtraBold - Splash screen, hero text, large numbers
  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w800,
    color: HseelColors.gray900,
  );

  /// 28px Bold - Page titles (e.g., "Home", "Explore", "My Portfolio")
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.29,
    fontWeight: FontWeight.w700,
    color: HseelColors.gray900,
  );

  /// 24px Bold - Section headers within pages
  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.33,
    fontWeight: FontWeight.w700,
    color: HseelColors.gray900,
  );

  /// 20px SemiBold - Card titles, sub-sections
  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.40,
    fontWeight: FontWeight.w600,
    color: HseelColors.gray900,
  );

  /// 18px SemiBold - Sub-headers, dialog titles
  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.44,
    fontWeight: FontWeight.w600,
    color: HseelColors.gray900,
  );

  // ═══════════════════════════════════════
  // BODY TEXT
  // ═══════════════════════════════════════

  /// 16px Regular - Primary body text, descriptions
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.50,
    fontWeight: FontWeight.w400,
    color: HseelColors.gray700,
  );

  /// 14px Regular - Default body text
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.57,
    fontWeight: FontWeight.w400,
    color: HseelColors.gray700,
  );

  /// 12px Regular - Secondary text, captions, helper text
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.50,
    fontWeight: FontWeight.w400,
    color: HseelColors.gray500,
  );

  // ═══════════════════════════════════════
  // LABELS & CAPTIONS
  // ═══════════════════════════════════════

  /// 11px Medium - Labels, badges, timestamps
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 1.45,
    fontWeight: FontWeight.w500,
    color: HseelColors.gray500,
  );

  /// 10px SemiBold - Overline text, section labels (uppercase)
  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    height: 1.40,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: HseelColors.gray500,
  );

  // ═══════════════════════════════════════
  // BUTTONS
  // ═══════════════════════════════════════

  /// 16px SemiBold - Primary CTA buttons
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.50,
    fontWeight: FontWeight.w600,
  );

  /// 14px SemiBold - Standard buttons
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w600,
  );

  /// 12px Medium - Small/compact buttons
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
  );

  // ═══════════════════════════════════════
  // NAVIGATION
  // ═══════════════════════════════════════

  /// 11px Medium - Bottom navigation labels
  static const TextStyle tab = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 1.27,
    fontWeight: FontWeight.w500,
  );

  // ═══════════════════════════════════════
  // FORM
  // ═══════════════════════════════════════

  /// 14px Regular - Form input text
  static const TextStyle input = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w400,
    color: HseelColors.gray900,
  );

  /// 12px Medium - Input labels
  static const TextStyle inputLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
    color: HseelColors.gray700,
  );

  /// 12px Regular - Input helper/error text
  static const TextStyle inputHelper = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w400,
    color: HseelColors.gray500,
  );

  // ═══════════════════════════════════════
  // FINANCIAL NUMBERS
  // ═══════════════════════════════════════

  /// 28px Bold - Large financial amounts (wallet balance, total investment)
  static const TextStyle amountLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.29,
    fontWeight: FontWeight.w700,
    color: HseelColors.gray900,
  );

  /// 20px SemiBold - Medium financial amounts (card values)
  static const TextStyle amountMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.40,
    fontWeight: FontWeight.w600,
    color: HseelColors.gray900,
  );

  /// 14px SemiBold - Small financial amounts (list items)
  static const TextStyle amountSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w600,
    color: HseelColors.gray900,
  );

  /// 12px Medium - Percentage values (returns, yields)
  static const TextStyle percentage = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
    color: HseelColors.primaryLight,
  );
}
