import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Assuming AppTextStyles and AppSpacing are defined elsewhere
// For example:
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
  TextStyle get body => TextStyle(fontSize: r.sp(16), color: const Color(0xFF1B1B1B));
  // Add other styles as needed
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);
  // Define spacing values if needed
}

class NafathEnglishScreen extends StatefulWidget {
  const NafathEnglishScreen({super.key});

  @override
  State<NafathEnglishScreen> createState() => _NafathEnglishScreenState();
}

class _NafathEnglishScreenState extends State<NafathEnglishScreen> {
  bool _showWaiting = false;

  void _proceedToWaiting() {
    setState(() {
      _showWaiting = true;
    });
  }

  void _goBack() {
    // In a real app, this would use Navigator.pop(context) or a router.
    // For this example, we'll just toggle the state back.
    if (_showWaiting) {
      setState(() {
        _showWaiting = false;
      });
    } else {
      // Navigate to welcome screen
      print("Navigate to /welcome-en");
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _showWaiting
            ? NafathWaiting(
                key: const ValueKey('waiting'),
                onRetry: () {},
              )
            : NafathModal(
                key: const ValueKey('modal'),
                onProceed: _proceedToWaiting,
                onClose: _goBack,
              ),
      ),
    );
  }
}

class NafathModal extends StatelessWidget {
  final VoidCallback onProceed;
  final VoidCallback onClose;

  const NafathModal({super.key, required this.onProceed, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Stack(
      children: [
        // This simulates the dimmed background, assuming the modal is shown over another screen.
        // In a real app, this would be part of the modal route.
        const ModalBarrier(color: Colors.black38, dismissible: false),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(r.radius(24)),
              topRight: Radius.circular(r.radius(24)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: r.wp(6), vertical: r.hp(2)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: r.wp(10),
                    height: r.hp(0.5),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(r.radius(10)),
                    ),
                  ),
                  r.verticalSpace(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 40), // Placeholder for alignment
                      Text(
                        'Sign In via Nafath',
                        style: styles.body.copyWith(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B)),
                      ),
                      GestureDetector(
                        onTap: onClose,
                        child: Container(
                          width: r.icon(32),
                          height: r.icon(32),
                          decoration: const BoxDecoration(
                            color: Color(0xFFEDF2F9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.close, size: r.icon(16), color: const Color(0xFF9CA3AF)),
                        ),
                      ),
                    ],
                  ),
                  r.verticalSpace(20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: r.hp(2.5), horizontal: r.wp(6)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF2F9),
                      borderRadius: BorderRadius.circular(r.radius(16)),
                    ),
                    child: const Center(
                      child: Column(
                        children: [
                          Text(
                            'Nafath',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF1B2A4A)),
                          ),
                          Text(
                            'National Single Sign-On',
                            style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  r.verticalSpace(20),
                  Text(
                    'A verification request will be sent to the Nafath app on your phone. Please open the app and approve the request.',
                    textAlign: TextAlign.center,
                    style: styles.body.copyWith(fontSize: r.sp(13), color: const Color(0xFF6B7280), height: 1.7),
                  ),
                  r.verticalSpace(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      borderRadius: BorderRadius.circular(r.radius(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ID Number', style: styles.body.copyWith(fontSize: r.sp(12), color: const Color(0xFF9CA3AF))),
                        Text('1098765432', style: styles.body.copyWith(fontSize: r.sp(14), fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B))),
                      ],
                    ),
                  ),
                  r.verticalSpace(20),
                  ElevatedButton(
                    onPressed: onProceed,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(16))),
                      elevation: 0,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1B2A4A), Color(0xFF2E5090)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(r.radius(16)),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: r.hp(2)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send Verification Request',
                              style: styles.body.copyWith(fontSize: r.sp(14), fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            r.horizontalSpace(8),
                            Icon(Icons.chevron_left, color: Colors.white, size: r.icon(16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NafathWaiting extends StatefulWidget {
  final VoidCallback onRetry;

  const NafathWaiting({super.key, required this.onRetry});

  @override
  State<NafathWaiting> createState() => _NafathWaitingState();
}

class _NafathWaitingState extends State<NafathWaiting> {
  static const int _timerSeconds = 60;
  late Timer _timer;
  int _seconds = _timerSeconds;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void _handleRetry() {
    _timer.cancel();
    setState(() {
      _seconds = _timerSeconds;
    });
    _startTimer();
    widget.onRetry();
  }

  String _formatTime(int seconds) {
    final m = (seconds / 60).floor().toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final isExpired = _seconds <= 0;
    final isLow = _seconds <= 10 && _seconds > 0;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: r.wp(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: r.icon(80),
              height: r.icon(80),
              decoration: BoxDecoration(
                color: const Color(0xFF1B2A4A),
                borderRadius: BorderRadius.circular(r.radius(16)),
              ),
              alignment: Alignment.center,
              child: Text('Nafath', style: styles.heading1.copyWith(fontSize: r.sp(28), color: Colors.white)),
            ),
            r.verticalSpace(24),
            Text(
              isExpired ? "Request Expired" : "Waiting for Verification",
              style: styles.body.copyWith(fontSize: r.sp(18), fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B)),
            ),
            r.verticalSpace(8),
            Text(
              isExpired
                  ? "The verification time has expired. Please resend the request and try again."
                  : "Please open the Nafath app on your phone and approve the verification request",
              textAlign: TextAlign.center,
              style: styles.body.copyWith(fontSize: r.sp(13), color: const Color(0xFF6B7280), height: 1.7),
            ),
            r.verticalSpace(32),
            if (isExpired)
              Container(
                width: r.icon(56),
                height: r.icon(56),
                decoration: const BoxDecoration(
                  color: Color(0xFFFEF2F2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.error_outline, size: r.icon(28), color: const Color(0xFFDC2626)),
              )
            else
              SizedBox(
                width: r.icon(40),
                height: r.icon(40),
                child: const CircularProgressIndicator(strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E5090))),
              ),
            r.verticalSpace(24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: r.wp(8), vertical: r.hp(2)),
              decoration: BoxDecoration(
                color: isExpired ? const Color(0xFFFEF2F2) : (isLow ? const Color(0xFFFFF7ED) : const Color(0xFFEDF2F9)),
                borderRadius: BorderRadius.circular(r.radius(16)),
              ),
              child: Column(
                children: [
                  Text(
                    'Time Remaining',
                    style: styles.body.copyWith(fontSize: r.sp(10), fontWeight: FontWeight.w600, color: const Color(0xFF9CA3AF), letterSpacing: 1.1),
                  ),
                  r.verticalSpace(4),
                  Text(
                    _formatTime(_seconds),
                    style: styles.heading1.copyWith(
                      fontSize: r.sp(28),
                      color: isExpired ? const Color(0xFFDC2626) : (isLow ? const Color(0xFFEA580C) : const Color(0xFF1B2A4A)),
                    ),
                  ),
                ],
              ),
            ),
            r.verticalSpace(32),
            TextButton.icon(
              onPressed: _handleRetry,
              icon: Icon(Icons.refresh, size: r.icon(16), color: const Color(0xFF2E5090)),
              label: Text(
                'Resend Request',
                style: styles.body.copyWith(fontSize: r.sp(13), fontWeight: FontWeight.w600, color: const Color(0xFF2E5090)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
