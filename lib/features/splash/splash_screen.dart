import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _iconCtrl, _textCtrl, _progressCtrl;

  @override
  void initState() {
    super.initState();
    _iconCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _textCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _progressCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _iconCtrl.forward();
    Future.delayed(const Duration(milliseconds: 800), () => _textCtrl.forward());
    Future.delayed(const Duration(milliseconds: 1600), () => _progressCtrl.forward());
    Future.delayed(const Duration(milliseconds: 3200), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override void dispose() { _iconCtrl.dispose(); _textCtrl.dispose(); _progressCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.5, -1), end: Alignment(0.5, 1),
            colors: [Color(0xFF1B2A4A), Color(0xFF0F1B2D), Color(0xFF1B2A4A)],
          ),
        ),
        child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
          ScaleTransition(
            scale: Tween(begin: 0.3, end: 1.0).animate(CurvedAnimation(parent: _iconCtrl, curve: Curves.easeOutBack)),
            child: Container(
              width: r.wp(24), height: r.wp(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(r.wp(6)),
              ),
              child: Center(child: Image.asset('assets/images/icon_white.png', width: r.wp(16))),
            ),
          ),
          SizedBox(height: r.hp(3)),
          FadeTransition(opacity: _textCtrl, child: Column(children: [
            Image.asset('assets/images/logo_white.png', height: r.hp(3.5)),
            SizedBox(height: r.hp(1)),
            Text('REAL ESTATE INVESTMENT', style: TextStyle(
              fontSize: r.sp(12), fontWeight: FontWeight.w500, letterSpacing: 3,
              color: Colors.white.withOpacity(0.4))),
          ])),
          SizedBox(height: r.hp(4)),
          AnimatedBuilder(animation: _progressCtrl, builder: (_, __) => Container(
            width: r.wp(40), height: 4,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: BorderRadius.circular(2)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft, widthFactor: _progressCtrl.value,
              child: Container(decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4A7BC7), Color(0xFF2D6A4F)]),
                borderRadius: BorderRadius.circular(2),
              )),
            ),
          )),
        ])),
      ),
    );
  }
}
