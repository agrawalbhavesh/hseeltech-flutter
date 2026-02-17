import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
  TextStyle get body => TextStyle(fontSize: r.sp(16), color: const Color(0xFF1B1B1B));
  TextStyle get subtitle => TextStyle(fontSize: r.sp(12), color: const Color(0xFF6B7280));
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);

  double get screenPadding => r.wp(5);
}

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  final List<int> _pin = [];

  void _handleDigit(int digit) {
    if (_pin.length < 6) {
      setState(() {
        _pin.add(digit);
      });
    }
  }

  void _handleDelete() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: r.wp(8)),
          child: Column(
            children: [
              const Spacer(),
              Image.network(
                'https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/kWaatjYYcIFYYmIk.png',
                height: r.hp(7),
              ),
              r.verticalSpace(32),
              Text(
                'Enter Your PIN',
                style: styles.body.copyWith(fontSize: r.sp(16), fontWeight: FontWeight.bold),
              ),
              r.verticalSpace(8),
              Text(
                'Enter your 6-digit PIN to access your account',
                style: styles.subtitle.copyWith(fontSize: r.sp(12)),
                textAlign: TextAlign.center,
              ),
              r.verticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: r.wp(1.5)),
                    width: r.wp(4),
                    height: r.wp(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index < _pin.length ? const Color(0xFF1B2A4A) : Colors.transparent,
                      border: Border.all(
                        color: index < _pin.length ? const Color(0xFF1B2A4A) : const Color(0xFFE2E8F0),
                        width: 2,
                      ),
                    ),
                  );
                }),
              ),
              r.verticalSpace(64),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: r.hp(1.5),
                  crossAxisSpacing: r.wp(3),
                  childAspectRatio: 1.5,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ...List.generate(9, (i) => _buildNumpadButton((i + 1).toString(), () => _handleDigit(i + 1), r, styles)),
                    _buildNumpadButton(
                      'fingerprint',
                      () {},
                      r,
                      styles,
                      icon: Icons.fingerprint,
                      bgColor: const Color(0xFFEDF2F9),
                      fgColor: const Color(0xFF2E5090),
                    ),
                    _buildNumpadButton('0', () => _handleDigit(0), r, styles),
                    _buildNumpadButton('delete', _handleDelete, r, styles, icon: Icons.backspace_outlined, fgColor: const Color(0xFF9CA3AF)),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.fingerprint, size: r.icon(16), color: const Color(0xFF2E7D32)),
                label: Text(
                  'Use Biometrics Instead',
                  style: TextStyle(fontSize: r.sp(13), fontWeight: FontWeight.w600, color: const Color(0xFF2E7D32)),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumpadButton(String text, VoidCallback onPressed, Responsive r, AppTextStyles styles, {IconData? icon, Color? bgColor, Color? fgColor}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bgColor ?? const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r.radius(16)),
          side: BorderSide(color: const Color(0xFFE2E8F0)),
        ),
      ),
      child: icon != null
          ? Icon(icon, size: r.icon(24), color: fgColor ?? const Color(0xFF1B1B1B))
          : Text(
              text,
              style: TextStyle(fontSize: r.sp(20), fontWeight: FontWeight.w600, color: fgColor ?? const Color(0xFF1B1B1B)),
            ),
    );
  }
}
