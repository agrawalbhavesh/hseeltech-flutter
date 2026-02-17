// Error States Screen (English)
// ==============================
// Centralized error handling with 6 error types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ── Error Type Enum ──
enum ErrorType { network, server, timeout, session, notFound, maintenance }

// ── Error Data Model ──
class ErrorData {
  final ErrorType type;
  final String code;
  final String title;
  final String message;
  final String primaryLabel;
  final Color primaryColor;
  final String? secondaryLabel;
  final IconData icon;

  const ErrorData({
    required this.type,
    required this.code,
    required this.title,
    required this.message,
    required this.primaryLabel,
    required this.primaryColor,
    this.secondaryLabel,
    required this.icon,
  });
}

// ── Predefined Error States ──
class AppErrors {
  static const network = ErrorData(
    type: ErrorType.network,
    code: 'ERR_NETWORK',
    title: 'No Internet Connection',
    message: 'Please check your Wi-Fi or mobile data and try again.',
    primaryLabel: 'Try Again',
    primaryColor: Color(0xFFDC2626),
    secondaryLabel: 'Open Settings',
    icon: Icons.wifi_off_rounded,
  );

  static const server = ErrorData(
    type: ErrorType.server,
    code: 'ERROR 500',
    title: 'Something Went Wrong',
    message: 'Our servers are experiencing issues. Please try again shortly.',
    primaryLabel: 'Retry',
    primaryColor: Color(0xFFF59E0B),
    secondaryLabel: 'Report Issue',
    icon: Icons.dns_rounded,
  );

  static const timeout = ErrorData(
    type: ErrorType.timeout,
    code: 'ERR_TIMEOUT',
    title: 'Request Timed Out',
    message: 'The server took too long to respond.',
    primaryLabel: 'Try Again',
    primaryColor: Color(0xFFDC2626),
    secondaryLabel: 'Check Connection',
    icon: Icons.timer_off_rounded,
  );

  static const session = ErrorData(
    type: ErrorType.session,
    code: 'SESSION_EXPIRED',
    title: 'Session Expired',
    message: 'Your session has expired. Please sign in again.',
    primaryLabel: 'Sign In Again',
    primaryColor: Color(0xFF2E5090),
    icon: Icons.lock_clock_rounded,
  );

  static const notFound = ErrorData(
    type: ErrorType.notFound,
    code: 'ERROR 404',
    title: 'Page Not Found',
    message: 'The page does not exist or has been moved.',
    primaryLabel: 'Go Home',
    primaryColor: Color(0xFF1B2A4A),
    secondaryLabel: 'Go Back',
    icon: Icons.find_in_page_rounded,
  );

  static const maintenance = ErrorData(
    type: ErrorType.maintenance,
    code: 'MAINTENANCE',
    title: 'Under Maintenance',
    message: 'Scheduled maintenance in progress. Back shortly.',
    primaryLabel: 'Check Status',
    primaryColor: Color(0xFF2E5090),
    icon: Icons.build_circle_rounded,
  );
}

// ── Error Screen Widget ──
class ErrorScreen extends StatelessWidget {
  final ErrorData error;
  final VoidCallback onPrimaryAction;
  final VoidCallback? onSecondaryAction;

  const ErrorScreen({
    super.key,
    required this.error,
    required this.onPrimaryAction,
    this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new, size: 18),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(error.icon, size: 80,
                      color: error.primaryColor.withOpacity(0.8)),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: error.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(error.code,
                        style: TextStyle(fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: error.primaryColor)),
                    ),
                    const SizedBox(height: 12),
                    Text(error.title,
                      style: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1B2A4A)),
                      textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    Text(error.message,
                      style: const TextStyle(fontSize: 13,
                        color: Color(0xFF6B7280), height: 1.5),
                      textAlign: TextAlign.center),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          onPrimaryAction();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: error.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(error.primaryLabel,
                          style: const TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                      ),
                    ),
                    if (error.secondaryLabel != null)
                      TextButton(
                        onPressed: onSecondaryAction,
                        child: Text(error.secondaryLabel!,
                          style: const TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2E5090))),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Text.rich(TextSpan(
                style: const TextStyle(fontSize: 11,
                  color: Color(0xFF9CA3AF)),
                children: [
                  const TextSpan(text: 'Need help? '),
                  TextSpan(text: 'Contact Support',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2E5090))),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage:
// ErrorScreen(
//   error: AppErrors.network,
//   onPrimaryAction: () => retryLastRequest(),
//   onSecondaryAction: () => openAppSettings(),
// )
