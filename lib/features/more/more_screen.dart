import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// More / Services Screen (English)
/// Comprehensive services hub with quick actions grid and grouped sections.
/// Accessible from Home screen via the "More" quick action button.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  // Design tokens
  static const navy = Color(0xFF1B2A4A);
  static const blue = Color(0xFF2E5090);
  static const green = Color(0xFF059669);
  static const amber = Color(0xFFD97706);
  static const purple = Color(0xFF7C3AED);
  static const skyBlue = Color(0xFF0284C7);
  static const dark = Color(0xFF1B1B1B);
  static const gray = Color(0xFF6B7280);
  static const grayLight = Color(0xFF9CA3AF);
  static const border = Color(0xFFE2E8F0);
  static const blueGhost = Color(0xFFF8FAFC);
  static const bluePale = Color(0xFFEDF2F9);
  static const red = Color(0xFFDC2626);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    return Scaffold(
      backgroundColor: blueGhost,
      body: SafeArea(
        child: Column(children: [
          // Header
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(r.wp(5), r.hp(2), r.wp(5), r.hp(2)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.chevron_left, size: r.icon(24), color: navy),
                ),
                SizedBox(width: r.wp(3)),
                Text('More', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontSize: r.sp(20), fontWeight: FontWeight.w700, color: navy)),
              ]),
              Padding(
                padding: EdgeInsets.only(left: r.wp(9)),
                child: Text('All services and settings', style: TextStyle(
                  fontFamily: 'MontserratArabic', fontSize: r.sp(12), color: grayLight)),
              ),
            ]),
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(r.wp(4)),
              child: Column(children: [
                // Quick Services Grid
                _buildSection(r, 'Quick Services', [
                  _buildQuickActionsGrid(r),
                ]),
                SizedBox(height: r.hp(1.5)),
                // Account Management
                _buildSection(r, 'Account Management', [
                  _buildRow(r, Icons.account_balance, bluePale, blue, 'Bank Accounts', 'Manage linked IBAN accounts'),
                  _buildRow(r, Icons.edit, bluePale, blue, 'Edit Profile', 'Personal information & address'),
                  _buildRow(r, Icons.verified_user, const Color(0xFFECFDF5), green, 'Identity Verification', 'KYC status & verification', badge: 'Complete'),
                  _buildRow(r, Icons.lock, const Color(0xFFFEF3C7), amber, 'Security & PIN', 'Change PIN & biometrics'),
                ]),
                SizedBox(height: r.hp(1.5)),
                // Investment Tools
                _buildSection(r, 'Investment Tools', [
                  _buildRow(r, Icons.history, bluePale, blue, 'Transaction History', 'All financial operations'),
                  _buildRow(r, Icons.work, const Color(0xFFECFDF5), green, 'Portfolio Summary', 'Investment performance & returns'),
                  _buildRow(r, Icons.bar_chart, const Color(0xFFEDE9FE), purple, 'Available Opportunities', 'Browse investment properties'),
                ]),
                SizedBox(height: r.hp(1.5)),
                // Rewards & Referrals
                _buildSection(r, 'Rewards & Referrals', [
                  _buildRow(r, Icons.card_giftcard, const Color(0xFFFEF3C7), amber, 'Rewards Program', 'Points, tiers & benefits'),
                  _buildRow(r, Icons.group, const Color(0xFFECFDF5), green, 'Invite a Friend', 'Earn rewards for referrals'),
                  _buildRow(r, Icons.notifications, bluePale, blue, 'Notifications', 'Alerts & updates', badge: '3'),
                ]),
                SizedBox(height: r.hp(1.5)),
                // Support & Help
                _buildSection(r, 'Support & Help', [
                  _buildRow(r, Icons.help_outline, bluePale, blue, 'FAQ', 'Answers to common questions'),
                  _buildRow(r, Icons.headset_mic, const Color(0xFFECFDF5), green, 'Contact Us', 'Technical support & assistance'),
                  _buildRow(r, Icons.chat_bubble_outline, const Color(0xFFEDE9FE), purple, 'Live Chat', 'Chat with support team'),
                ]),
                SizedBox(height: r.hp(1.5)),
                // Settings & Legal
                _buildSection(r, 'Settings & Legal', [
                  _buildRow(r, Icons.settings, bluePale, blue, 'Settings', 'Language, notifications & security'),
                  _buildRow(r, Icons.description, const Color(0xFFF3F4F6), gray, 'Terms & Conditions', 'Investor rights & obligations'),
                  _buildRow(r, Icons.shield, const Color(0xFFF3F4F6), gray, 'Privacy Policy', 'Data protection & compliance'),
                  _buildRow(r, Icons.warning_amber, const Color(0xFFFEF2F2), red, 'Risk Disclosure', 'Investment risks & warnings'),
                ]),
                SizedBox(height: r.hp(2)),
                // App Version
                Center(child: Text('Hseeltech Version 1.0.0', style: TextStyle(
                  fontFamily: 'MontserratArabic', fontSize: r.sp(10), color: grayLight))),
                SizedBox(height: r.hp(2)),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildQuickActionsGrid(Responsive r) {
    return Padding(
      padding: EdgeInsets.all(r.wp(4)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _buildQuickAction(r, Icons.arrow_downward, 'Deposit', const Color(0xFFECFDF5), green),
        _buildQuickAction(r, Icons.arrow_upward, 'Withdraw', const Color(0xFFFEF3C7), amber),
        _buildQuickAction(r, Icons.swap_horiz, 'Transfer', const Color(0xFFEDE9FE), purple),
        _buildQuickAction(r, Icons.receipt_long, 'Statement', const Color(0xFFE0F2FE), skyBlue),
      ]),
    );
  }

  Widget _buildQuickAction(Responsive r, IconData icon, String label, Color bg, Color iconColor) {
    return Column(children: [
      Container(
        width: r.wp(14), height: r.wp(14),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(r.radius(16))),
        child: Icon(icon, size: r.icon(20), color: iconColor),
      ),
      SizedBox(height: r.hp(1)),
      Text(label, style: TextStyle(fontFamily: 'MontserratArabic', fontSize: r.sp(10), color: gray)),
    ]);
  }

  Widget _buildSection(Responsive r, String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: border),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != 'Quick Services')
          Padding(
            padding: EdgeInsets.fromLTRB(r.wp(4), r.hp(1.5), r.wp(4), r.hp(0.5)),
            child: Text(title.toUpperCase(), style: TextStyle(
              fontFamily: 'MontserratArabic', fontSize: r.sp(10),
              fontWeight: FontWeight.w700, color: grayLight, letterSpacing: 1.2)),
          ),
        ...children,
      ]),
    );
  }

  Widget _buildRow(Responsive r, IconData icon, Color iconBg, Color iconColor,
      String label, String subtitle, {String? badge}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
        child: Row(children: [
          Container(
            width: r.wp(9), height: r.wp(9),
            decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(r.radius(12))),
            child: Icon(icon, size: r.icon(16), color: iconColor),
          ),
          SizedBox(width: r.wp(3)),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: TextStyle(fontFamily: 'MontserratArabic',
              fontSize: r.sp(12), fontWeight: FontWeight.w600, color: dark)),
            Text(subtitle, style: TextStyle(fontFamily: 'MontserratArabic',
              fontSize: r.sp(10), color: grayLight)),
          ])),
          if (badge != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.3)),
              decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(r.radius(12))),
              child: Text(badge, style: TextStyle(fontFamily: 'MontserratArabic',
                fontSize: r.sp(9), fontWeight: FontWeight.w700, color: Colors.white)),
            ),
          SizedBox(width: r.wp(1)),
          Icon(Icons.chevron_right, size: r.icon(16), color: grayLight),
        ]),
      ),
    );
  }
}
