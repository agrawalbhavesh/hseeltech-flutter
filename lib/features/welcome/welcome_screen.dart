import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Assuming AppTextStyles and AppSpacing are defined elsewhere
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get body => TextStyle(fontSize: r.sp(14));
  TextStyle get title => TextStyle(fontSize: r.sp(20), fontWeight: FontWeight.bold);
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);

  double get small => r.wp(2);
  double get medium => r.wp(4);
  double get large => r.wp(6);
}

class WelcomeEnglishScreen extends StatelessWidget {
  const WelcomeEnglishScreen({Key? key}) : super(key: key);

  static const Color navy = Color(0xFF1B2A4A);
  static const Color blue = Color(0xFF2E5090);
  static const Color blueLight = Color(0xFF4A7BC7);
  static const Color green = Color(0xFF2D6A4F);
  static const Color dark = Color(0xFF1B1B1B);
  static const Color gray = Color(0xFF6B7280);
  static const Color grayLight = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE2E8F0);
  static const Color blueGhost = Color(0xFFF5F8FC);


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [navy, Color(0xFF1E3A5F), blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: r.hp(5)),
                    Image.asset('assets/logos/white.png', height: r.hp(8)),
                    SizedBox(height: r.verticalSpace(20)),
                    Text(
                      'Invest in Premium Saudi Real Estate',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: r.sp(15), color: white.withOpacity(0.8)),
                    ),
                    SizedBox(height: r.verticalSpace(8)),
                    Text(
                      'Starting from just SAR 500',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: r.sp(13), color: white.withOpacity(0.6)),
                    ),
                    SizedBox(height: r.verticalSpace(30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTrustBadge(r, icon: Icons.shield_outlined, text: 'Secure & Trusted'),
                        _buildTrustBadge(r, icon: Icons.apartment_outlined, text: 'Premium Properties'),
                        _buildTrustBadge(r, icon: Icons.fingerprint, text: 'Nafath Verified'),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              color: white,
              padding: EdgeInsets.symmetric(horizontal: r.wp(6), vertical: r.hp(2)),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () { /* Handle Sign In */ },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: navy,
                      minimumSize: Size(double.infinity, r.hp(6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(r.radius(12)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login, size: r.icon(20), color: white),
                        SizedBox(width: r.horizontalSpace(10)),
                        Text('Sign In', style: TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: white)),
                      ],
                    ),
                  ),
                  SizedBox(height: r.verticalSpace(12)),
                  OutlinedButton(
                    onPressed: () { /* Handle Create Account */ },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: navy,
                      side: const BorderSide(color: navy, width: 2),
                      minimumSize: Size(double.infinity, r.hp(6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(r.radius(12)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add_alt_1_outlined, size: r.icon(20)),
                        SizedBox(width: r.horizontalSpace(10)),
                        Text('Create New Account', style: TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: r.verticalSpace(16)),
                  Container(
                    padding: EdgeInsets.all(r.wp(3.5)),
                    decoration: BoxDecoration(
                      color: blueGhost,
                      border: Border.all(color: border),
                      borderRadius: BorderRadius.circular(r.radius(12)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: r.wp(8),
                          height: r.wp(8),
                          decoration: BoxDecoration(
                            color: navy,
                            borderRadius: BorderRadius.circular(r.radius(8)),
                          ),
                          child: Center(
                            child: Text(
                              'نفاذ',
                              style: TextStyle(fontSize: r.sp(10), fontWeight: FontWeight.bold, color: white),
                            ),
                          ),
                        ),
                        SizedBox(width: r.horizontalSpace(12)),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: r.sp(11), color: gray, height: 1.5),
                              children: const <TextSpan>[
                                TextSpan(text: 'All sign-in and registration is done through '),
                                TextSpan(text: 'Nafath National Service', style: TextStyle(fontWeight: FontWeight.bold, color: dark)),
                                TextSpan(text: ' for secure identity verification'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: r.verticalSpace(8)),
                  TextButton(
                     onPressed: () { /* Handle language toggle */ },
                     child: Text('العربية', style: TextStyle(fontSize: r.sp(13), color: blue, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: r.verticalSpace(4)),
                   Text(
                    'This product/service is being tested within REGA's Regulatory Sandbox and is not formally licensed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: r.sp(9), color: grayLight, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrustBadge(Responsive r, {required IconData icon, required String text}) {
    return Column(
      children: [
        Container(
          width: r.wp(12),
          height: r.wp(12),
          decoration: BoxDecoration(
            color: white.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: white, size: r.icon(20)),
        ),
        SizedBox(height: r.verticalSpace(4)),
        Text(text, style: TextStyle(fontSize: r.sp(10), color: white.withOpacity(0.7))),
      ],
    );
  }
}
