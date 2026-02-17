import 'package:flutter/material.dart';
import 'dart:async';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Assuming AppTextStyles and AppSpacing are defined elsewhere
// For example:
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
  TextStyle get body => TextStyle(fontSize: r.sp(16), color: const Color(0xFF6B7280));
  TextStyle get button => TextStyle(fontSize: r.sp(15), fontWeight: FontWeight.bold, color: Colors.white);
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);

  EdgeInsets get pagePadding => EdgeInsets.symmetric(horizontal: r.wp(5));
}

class RegisterEnglishScreen extends StatefulWidget {
  const RegisterEnglishScreen({super.key});

  @override
  State<RegisterEnglishScreen> createState() => _RegisterEnglishScreenState();
}

class _RegisterEnglishScreenState extends State<RegisterEnglishScreen> {
  String _view = 'form';
  String _nationalId = '';

  void _onVerify(String id) {
    setState(() {
      _nationalId = id;
      _view = 'waiting';
    });
  }

  void _onBack() {
    // In a real app, this would use Navigator.pop(context) or a router.
    // For this example, we'll just switch the view back.
    if (_view == 'waiting') {
      setState(() {
        _view = 'form';
      });
    } else {
      // setLocation('/welcome-en') equivalent
      print("Navigate to /welcome-en");
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _view == 'form'
              ? _RegisterForm(
                  key: const ValueKey('form'),
                  onVerify: _onVerify,
                  onBack: _onBack,
                )
              : _NafathWaiting(
                  key: const ValueKey('waiting'),
                  nationalId: _nationalId,
                  onRetry: () => setState(() => _view = 'form'),
                ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  final void Function(String) onVerify;
  final VoidCallback onBack;

  const _RegisterForm({super.key, required this.onVerify, required this.onBack});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _nationalIdController = TextEditingController();
  bool _agreed = false;

  @override
  void initState() {
    super.initState();
    _nationalIdController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    final isButtonEnabled = _nationalIdController.text.length == 10 && _agreed;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(1.5)),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.onBack,
                  child: Container(
                    width: r.wp(8),
                    height: r.wp(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEDF2F9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.chevron_left, size: r.icon(20), color: const Color(0xFF1B2A4A)),
                  ),
                ),
                Text('Create New Account', style: TextStyle(fontSize: r.sp(17), fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B))),
                SizedBox(width: r.wp(8)),
              ],
            ),
          ),
          Padding(
            padding: spacing.pagePadding.copyWith(top: r.hp(3), bottom: r.hp(3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Nafath Logo / Icon
                Column(
                  children: [
                    Container(
                      width: r.wp(16),
                      height: r.wp(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDF2F9),
                        borderRadius: BorderRadius.circular(r.radius(16)),
                      ),
                      child: Icon(Icons.shield_outlined, size: r.icon(32), color: const Color(0xFF1B2A4A)),
                    ),
                    r.verticalSpace(12),
                    Text('Verify with Nafath', style: TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A))),
                  ],
                ),
                r.verticalSpace(24),

                // Info message
                Container(
                  padding: EdgeInsets.all(r.wp(4)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF2F9),
                    borderRadius: BorderRadius.circular(r.radius(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: r.wp(8),
                        height: r.wp(8),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E5090),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.info_outline, size: r.icon(16), color: Colors.white),
                      ),
                      r.horizontalSpace(12),
                      Expanded(
                        child: Text(
                          'Your identity will be verified through the national Nafath service. Please ensure your registered ID number is up to date.',
                          style: TextStyle(fontSize: r.sp(12), color: const Color(0xFF6B7280), height: 1.8),
                        ),
                      ),
                    ],
                  ),
                ),
                r.verticalSpace(24),

                // National ID Input
                Text('National ID / Iqama Number', style: TextStyle(fontSize: r.sp(13), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A))),
                r.verticalSpace(8),
                TextFormField(
                  controller: _nationalIdController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: '1XXXXXXXXX',
                    prefixIcon: Icon(Icons.perm_identity, color: const Color(0xFF9CA3AF), size: r.icon(20)),
                    suffixIcon: _nationalIdController.text.length == 10
                        ? Icon(Icons.check_circle_outline, color: const Color(0xFF2D6A4F), size: r.icon(20))
                        : null,
                    filled: true,
                    fillColor: const Color(0xFFF5F8FC),
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(r.radius(12)),
                      borderSide: BorderSide(color: _nationalIdController.text.isNotEmpty ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(r.radius(12)),
                      borderSide: BorderSide(color: _nationalIdController.text.isNotEmpty ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(r.radius(12)),
                      borderSide: const BorderSide(color: Color(0xFF2E5090), width: 2),
                    ),
                  ),
                ),
                r.verticalSpace(6),
                Text('Must be 10 digits', style: TextStyle(fontSize: r.sp(11), color: const Color(0xFF9CA3AF))),
                r.verticalSpace(24),

                // Terms checkbox
                GestureDetector(
                  onTap: () => setState(() => _agreed = !_agreed),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: r.wp(6),
                        height: r.wp(6),
                        decoration: BoxDecoration(
                          color: _agreed ? const Color(0xFF2E5090) : Colors.transparent,
                          border: Border.all(color: _agreed ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0)),
                          borderRadius: BorderRadius.circular(r.radius(8)),
                        ),
                        child: _agreed ? Icon(Icons.check, size: r.icon(14), color: Colors.white) : null,
                      ),
                      r.horizontalSpace(12),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: r.sp(12), color: const Color(0xFF6B7280), height: 1.6, fontFamily: 'Montserrat Arabic'),
                            children: const [
                              TextSpan(text: 'I agree to the '),
                              TextSpan(text: 'Terms & Conditions', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E5090))),
                              TextSpan(text: ' and '),
                              TextSpan(text: 'Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E5090))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                r.verticalSpace(24),

                // Verify button
                ElevatedButton(
                  onPressed: isButtonEnabled ? () => widget.onVerify(_nationalIdController.text) : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: r.hp(2)),
                    backgroundColor: const Color(0xFF2D6A4F),
                    disabledBackgroundColor: const Color(0xFF9CA3AF).withOpacity(0.6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(16))),
                    elevation: isButtonEnabled ? 8 : 0,
                    shadowColor: const Color(0xFF2D6A4F).withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Verify with Nafath', style: styles.button),
                      r.horizontalSpace(8),
                      Icon(Icons.arrow_forward, size: r.icon(16), color: Colors.white),
                    ],
                  ),
                ),
                r.verticalSpace(16),

                // Footer text
                Text(
                  'Powered by Nafath',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: r.sp(11), color: const Color(0xFF9CA3AF)),
                ),
                r.verticalSpace(16),

                Container(
                  padding: EdgeInsets.all(r.wp(3.5)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFBFD),
                    borderRadius: BorderRadius.circular(r.radius(12)),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Text(
                    'After successful verification, you will be asked to complete your personal information (mobile number and email).',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: r.sp(11), color: const Color(0xFF9CA3AF), height: 1.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NafathWaiting extends StatefulWidget {
  final String nationalId;
  final VoidCallback onRetry;

  const _NafathWaiting({super.key, required this.nationalId, required this.onRetry});

  @override
  State<_NafathWaiting> createState() => _NafathWaitingState();
}

class _NafathWaitingState extends State<_NafathWaiting> {
  static const int _timerSeconds = 120;
  late Timer _timer;
  int _seconds = _timerSeconds;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = _timerSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() => _seconds--);
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int s) {
    final m = (s / 60).floor().toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$m:$sec';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final isExpired = _seconds <= 0;
    final isLow = _seconds <= 15 && _seconds > 0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: r.wp(20),
            height: r.wp(20),
            margin: EdgeInsets.only(bottom: r.hp(3)),
            decoration: BoxDecoration(
              color: const Color(0xFF1B2A4A),
              borderRadius: BorderRadius.circular(r.radius(16)),
            ),
            alignment: Alignment.center,
            child: Text('Nafath', style: TextStyle(fontSize: r.sp(20), fontWeight: FontWeight.w800, color: Colors.white)),
          ),
          Text(
            isExpired ? 'Request Expired' : 'Waiting for Verification',
            style: TextStyle(fontSize: r.sp(18), fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B)),
          ),
          r.verticalSpace(8),
          Text(
            isExpired
                ? 'The verification time has expired. Please resend the request and try again.'
                : 'Please open the Nafath app on your phone and approve the verification request',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: r.sp(13), color: const Color(0xFF6B7280), height: 1.7),
          ),
          r.verticalSpace(12),
          if (!isExpired && widget.nationalId.isNotEmpty)
            Text(
              'ID Number: ${widget.nationalId}',
              style: TextStyle(fontSize: r.sp(12), fontWeight: FontWeight.w600, color: const Color(0xFF2E5090)),
            ),
          r.verticalSpace(24),
          if (isExpired)
            Container(
              width: r.wp(14),
              height: r.wp(14),
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
              color: isExpired ? const Color(0xFFFEF2F2) : isLow ? const Color(0xFFFFF7ED) : const Color(0xFFEDF2F9),
              borderRadius: BorderRadius.circular(r.radius(16)),
            ),
            child: Column(
              children: [
                Text(
                  'Time Remaining',
                  style: TextStyle(fontSize: r.sp(10), fontWeight: FontWeight.w600, letterSpacing: 1.1, color: const Color(0xFF9CA3AF)),
                ),
                r.verticalSpace(4),
                Text(
                  _formatTime(_seconds),
                  style: TextStyle(
                    fontSize: r.sp(28),
                    fontWeight: FontWeight.w800,
                    color: isExpired ? const Color(0xFFDC2626) : isLow ? const Color(0xFFEA580C) : const Color(0xFF1B2A4A),
                  ),
                ),
              ],
            ),
          ),
          r.verticalSpace(32),
          TextButton.icon(
            onPressed: () {
              widget.onRetry();
              _startTimer();
            },
            icon: Icon(Icons.refresh, size: r.icon(16)),
            label: Text('Resend Request', style: TextStyle(fontSize: r.sp(13), fontWeight: FontWeight.w600)),
            style: TextButton.styleFrom(foregroundColor: const Color(0xFF2E5090)),
          ),
        ],
      ),
    );
  }
}
"))(("file_response": {"output": "File written: /home/ubuntu/register_english_screen.dart"}}}))
