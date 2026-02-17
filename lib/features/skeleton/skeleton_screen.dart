// ============================================================
// SKELETON LOADING PATTERNS - Flutter Implementation Guide
// ============================================================
// 
// DEPENDENCY: Add to pubspec.yaml:
//   shimmer: ^3.0.0
//
// IMPORT:
//   import 'package:shimmer/shimmer.dart';
//
// ============================================================
// 1. BASE SHIMMER WIDGET (Reusable)
// ============================================================

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Reusable shimmer placeholder that matches actual component dimensions
class ShimmerBlock extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBlock({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8ECF1),
      highlightColor: const Color(0xFFF4F6F9),
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Circular shimmer placeholder for avatars and icons
class ShimmerCircle extends StatelessWidget {
  final double size;

  const ShimmerCircle({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE8ECF1),
      highlightColor: const Color(0xFFF4F6F9),
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// ============================================================
// 2. HOME SCREEN SKELETON
// ============================================================

class HomeScreenSkeleton extends StatelessWidget {
  const HomeScreenSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        // Header with gradient
        Container(
          padding: const EdgeInsets.fromLTRB(20, 56, 20, 24),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1B2A4A), Color(0xFF2E5090)],
            ),
          ),
          child: Column(
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBlock(width: 60, height: 10, borderRadius: 20),
                      const SizedBox(height: 8),
                      ShimmerBlock(width: 120, height: 14, borderRadius: 20),
                    ],
                  ),
                  Row(
                    children: [
                      ShimmerCircle(size: 32),
                      const SizedBox(width: 8),
                      ShimmerCircle(size: 32),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Portfolio card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBlock(width: 80, height: 10, borderRadius: 20),
                    const SizedBox(height: 12),
                    ShimmerBlock(width: 180, height: 32, borderRadius: 8),
                    const SizedBox(height: 8),
                    ShimmerBlock(width: 60, height: 12, borderRadius: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Quick Actions
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (_) => Column(
              children: [
                ShimmerCircle(size: 48),
                const SizedBox(height: 8),
                ShimmerBlock(width: 40, height: 8, borderRadius: 20),
              ],
            )),
          ),
        ),
        // Opportunity cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerBlock(width: 120, height: 14, borderRadius: 20),
              ShimmerBlock(width: 60, height: 10, borderRadius: 20),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// 3. HAPTIC FEEDBACK INTEGRATION
// ============================================================
//
// IMPORT:
//   import 'package:flutter/services.dart';
//
// USAGE PATTERNS:
//
// Light tap (buttons, list items, toggles):
//   HapticFeedback.lightImpact();
//
// Medium tap (navigation, tab switches):
//   HapticFeedback.mediumImpact();
//
// Heavy tap (destructive actions, confirmations):
//   HapticFeedback.heavyImpact();
//
// Selection changed (picker, slider):
//   HapticFeedback.selectionClick();
//
// Success/Error vibration:
//   HapticFeedback.vibrate();
//
// ============================================================
// RECOMMENDED HAPTIC MAPPING FOR HSEELTECH:
// ============================================================
//
// | Action                    | Haptic Type      |
// |---------------------------|------------------|
// | Button tap                | lightImpact      |
// | Tab switch                | selectionClick   |
// | Pull to refresh           | mediumImpact     |
// | Investment confirm        | heavyImpact      |
// | PIN digit entry           | lightImpact      |
// | Biometric success         | mediumImpact     |
// | Biometric failure         | vibrate          |
// | Deposit/Withdraw confirm  | heavyImpact      |
// | Swipe action              | selectionClick   |
// | Toggle switch             | lightImpact      |
// | Bottom nav tap            | selectionClick   |
// | Card favorite             | lightImpact      |
// | Form validation error     | vibrate          |
// | Success screen            | mediumImpact     |
// | Delete/Remove action      | heavyImpact      |
//
// ============================================================
// EXAMPLE: Haptic Button Widget
// ============================================================

import 'package:flutter/services.dart';

class HapticButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final HapticType hapticType;

  const HapticButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.hapticType = HapticType.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        switch (hapticType) {
          case HapticType.light:
            HapticFeedback.lightImpact();
            break;
          case HapticType.medium:
            HapticFeedback.mediumImpact();
            break;
          case HapticType.heavy:
            HapticFeedback.heavyImpact();
            break;
          case HapticType.selection:
            HapticFeedback.selectionClick();
            break;
        }
        onPressed();
      },
      child: child,
    );
  }
}

enum HapticType { light, medium, heavy, selection }

// ============================================================
// EXAMPLE: Bottom Navigation with Haptics
// ============================================================

class BottomNavWithHaptics extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavWithHaptics({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        HapticFeedback.selectionClick(); // Haptic on tab switch
        onTap(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Portfolio'),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

// ============================================================
// EXAMPLE: PIN Entry with Haptics
// ============================================================

class PinDigitButton extends StatelessWidget {
  final String digit;
  final Function(String) onDigitPressed;

  const PinDigitButton({
    Key? key,
    required this.digit,
    required this.onDigitPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact(); // Subtle tap for each digit
        onDigitPressed(digit);
      },
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade100,
        ),
        child: Center(
          child: Text(
            digit,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// EXAMPLE: Investment Confirm with Heavy Haptic
// ============================================================

void onInvestConfirm(BuildContext context, double amount) {
  HapticFeedback.heavyImpact(); // Strong feedback for financial action
  // ... proceed with investment
}

void onBiometricResult(bool success) {
  if (success) {
    HapticFeedback.mediumImpact(); // Success feedback
  } else {
    HapticFeedback.vibrate(); // Error feedback
  }
}
