// Empty States Screen — Flutter Implementation
// ==============================================
// Shows empty state patterns for 5 key screens.

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // For rich animations
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyStateWidget extends StatelessWidget {
  final String illustration; // Lottie asset path
  final String title;
  final String description;
  final String ctaText;
  final VoidCallback onCtaPressed;
  final Color accentColor;

  const EmptyStateWidget({
    required this.illustration,
    required this.title,
    required this.description,
    required this.ctaText,
    required this.onCtaPressed,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated illustration
            SizedBox(
              width: 200, height: 200,
              child: Lottie.asset(illustration, repeat: true),
            ),
            const SizedBox(height: 24),
            Text(title,
              style: const TextStyle(
                fontFamily: 'MontserratArabic',
                fontSize: 18, fontWeight: FontWeight.w700,
                color: Color(0xFF1B2A4A),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(description,
              style: const TextStyle(
                fontFamily: 'MontserratArabic',
                fontSize: 13, color: Color(0xFF9CA3AF),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onCtaPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(ctaText,
                style: const TextStyle(fontFamily: 'MontserratArabic', fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage examples:
// EmptyStateWidget(
//   illustration: 'assets/lottie/empty_portfolio.json',
//   title: 'No Investments Yet',
//   description: 'Start building your real estate portfolio today',
//   ctaText: 'Browse Opportunities',
//   onCtaPressed: () => Navigator.pushNamed(context, '/explore'),
//   accentColor: Color(0xFF2E5090),
// )
//
// Recommended Lottie assets:
// - empty_portfolio.json — Building with magnifying glass
// - empty_notifications.json — Bell with checkmark
// - empty_transactions.json — Receipt with clock
// - empty_search.json — Magnifying glass with question mark
// - empty_watchlist.json — Heart with bookmark
