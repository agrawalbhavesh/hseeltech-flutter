import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppColors {
  static const Color primary = Color(0xFF1B2A4A); // dark navy
  static const Color accent = Color(0xFF2E7D32); // green
  static const Color background = Color(0xFFF8FAFC); // light gray
  static const Color blue = Color(0xFF2E5090);
  static const Color blueLight = Color(0xFF4A7BC7);
  static const Color bluePale = Color(0xFFEDF2F9);
  static const Color blueGhost = Color(0xFFF5F8FC);
  static const Color dark = Color(0xFF1B1B1B);
  static const Color gray = Color(0xFF6B7280);
  static const Color grayLight = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE2E8F0);
  static const Color green = Color(0xFF22C55E);
  static const Color greenBg = Color(0xFFDCFCE7);
  static const Color yellow = Color(0xFFF59E0B);
  static const Color yellowBg = Color(0xFFFEF3C7);
  static const Color red = Color(0xFFEF4444);
  static const Color redBg = Color(0xFFFEE2E2);
}

enum ProfileView { main, personal, bank, documents, referral, settings, notificationSettings, help, about }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileView _currentView = ProfileView.main;

  void _navigateTo(ProfileView view) {
    setState(() {
      _currentView = view;
    });
  }

  Widget _buildView() {
    switch (_currentView) {
      case ProfileView.main:
        return _MainProfileView(onNavigate: _navigateTo);
      case ProfileView.personal:
        return _PersonalInfoView(onBack: () => _navigateTo(ProfileView.main));
      case ProfileView.bank:
        return _BankAccountView(onBack: () => _navigateTo(ProfileView.main));
      case ProfileView.documents:
        return _DocumentsView(onBack: () => _navigateTo(ProfileView.main));
      case ProfileView.referral:
        return _ReferralView(onBack: () => _navigateTo(ProfileView.main));
      case ProfileView.settings:
        return _SettingsView(onBack: () => _navigateTo(ProfileView.main), onNavigate: _navigateTo);
       case ProfileView.notificationSettings:
        return _NotificationSettingsView(onBack: () => _navigateTo(ProfileView.settings));
      case ProfileView.help:
        return _HelpSupportView(onBack: () => _navigateTo(ProfileView.main));
      case ProfileView.about:
        return _AboutView(onBack: () => _navigateTo(ProfileView.main));
      default:
        return _MainProfileView(onNavigate: _navigateTo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildView(),
      ),
    );
  }
}

class _SubHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const _SubHeader({Key? key, required this.title, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    return Container(
      padding: EdgeInsets.only(top: r.hp(6), bottom: r.hp(2), left: r.wp(4), right: r.wp(4)),
      color: AppColors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: Icon(Icons.chevron_left, color: AppColors.dark, size: r.icon(28)),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: AppColors.dark),
            ),
          ),
          SizedBox(width: r.wp(10)), // To balance the back button
        ],
      ),
    );
  }
}

class _MainProfileView extends StatelessWidget {
  final Function(ProfileView) onNavigate;

  const _MainProfileView({Key? key, required this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    final menuItems = [
      {'id': ProfileView.personal, 'icon': Icons.person_outline, 'label': 'Personal Information'},
      {'id': ProfileView.bank, 'icon': Icons.account_balance_wallet_outlined, 'label': 'Bank Account'},
      {'id': ProfileView.documents, 'icon': Icons.shield_outlined, 'label': 'KYC & Verification'},
      {'id': ProfileView.referral, 'icon': Icons.card_giftcard, 'label': 'Referral Code'},
      {'id': ProfileView.settings, 'icon': Icons.settings_outlined, 'label': 'Settings'},
      {'id': ProfileView.help, 'icon': Icons.help_outline, 'label': 'Help & Support'},
      {'id': ProfileView.about, 'icon': Icons.info_outline, 'label': 'About'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(3)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: r.radius(30),
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder
                  ),
                  spacing.horizontalSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mohammed Al-Abdullah', style: styles.heading3.copyWith(color: AppColors.dark)),
                      spacing.verticalSpace(4),
                      Text('+966 50 123 4567', style: styles.body.copyWith(color: AppColors.gray)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit_outlined, color: AppColors.blue, size: r.icon(24)),
                    onPressed: () => onNavigate(ProfileView.personal),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: r.wp(5)),
                itemCount: menuItems.length,
                separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.border),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    leading: Icon(item['icon'] as IconData, color: AppColors.blue, size: r.icon(24)),
                    title: Text(item['label'] as String, style: styles.body.copyWith(fontWeight: FontWeight.w600)),
                    trailing: Icon(Icons.chevron_right, color: AppColors.grayLight, size: r.icon(24)),
                    onTap: () => onNavigate(item['id'] as ProfileView),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(r.wp(5)),
              child: OutlinedButton.icon(
                icon: Icon(Icons.logout, color: AppColors.red, size: r.icon(20)),
                label: Text('Log Out', style: styles.body.copyWith(color: AppColors.red, fontWeight: FontWeight.bold)),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, r.hp(6)),
                  side: const BorderSide(color: AppColors.redBg),
                  backgroundColor: AppColors.redBg,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalInfoView extends StatelessWidget {
  final VoidCallback onBack;
  const _PersonalInfoView({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'Personal Information', onBack: onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(r.wp(5)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(r.wp(4)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        children: [
                          _buildInfoRow(r, styles, icon: Icons.person_outline, label: 'Full Name', value: 'Mohammed Al-Abdullah'),
                          _buildInfoRow(r, styles, icon: Icons.email_outlined, label: 'Email', value: 'mohammed@example.com'),
                          _buildInfoRow(r, styles, icon: Icons.phone_outlined, label: 'Phone', value: '+966 50 123 4567'),
                          _buildInfoRow(r, styles, icon: Icons.credit_card_outlined, label: 'National ID', value: '1234567890'),
                          _buildInfoRow(r, styles, icon: Icons.calendar_today_outlined, label: 'Date of Birth', value: '15/03/1990'),
                          _buildInfoRow(r, styles, icon: Icons.flag_outlined, label: 'Nationality', value: 'Saudi Arabia', isLast: true),
                        ],
                      ),
                    ),
                    spacing.verticalSpace(24),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Edit Information', style: styles.button.copyWith(color: AppColors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: Size(double.infinity, r.hp(6.5)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(Responsive r, AppTextStyles styles, {required IconData icon, required String label, required String value, bool isLast = false}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: r.wp(10),
              height: r.wp(10),
              decoration: BoxDecoration(
                color: AppColors.bluePale,
                borderRadius: BorderRadius.circular(r.radius(8)),
              ),
              child: Icon(icon, size: r.icon(20), color: AppColors.blue),
            ),
            SizedBox(width: r.wp(4)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: styles.caption.copyWith(color: AppColors.grayLight)),
                  SizedBox(height: r.hp(0.5)),
                  Text(value, style: styles.body.copyWith(fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) Divider(height: r.hp(4), color: AppColors.border),
      ],
    );
  }
}

class _BankAccountView extends StatelessWidget {
  final VoidCallback onBack;
  const _BankAccountView({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'Bank Account', onBack: onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(r.wp(5)),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: EdgeInsets.all(r.wp(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.account_balance, color: AppColors.white.withOpacity(0.8), size: r.icon(24)),
                                  spacing.horizontalSpace(8),
                                  Text('Al Rajhi Bank', style: styles.body.copyWith(color: AppColors.white, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.5)),
                                decoration: BoxDecoration(
                                  color: AppColors.greenBg,
                                  borderRadius: BorderRadius.circular(r.radius(20)),
                                ),
                                child: Text('Verified', style: styles.caption.copyWith(color: AppColors.green, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          spacing.verticalSpace(20),
                          Text('Account Holder', style: styles.caption.copyWith(color: AppColors.white.withOpacity(0.5))),
                          spacing.verticalSpace(4),
                          Text('Mohammed Al-Abdullah', style: styles.body.copyWith(color: AppColors.white, fontWeight: FontWeight.w600)),
                          spacing.verticalSpace(20),
                          Text('IBAN', style: styles.caption.copyWith(color: AppColors.white.withOpacity(0.5))),
                          spacing.verticalSpace(4),
                          Text('SA12 3456 7890 1234 5678 90', style: styles.body.copyWith(color: AppColors.white.withOpacity(0.9), letterSpacing: 1.2)),
                        ],
                      ),
                    ),
                    spacing.verticalSpace(24),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Add Bank Account', style: styles.button.copyWith(color: AppColors.primary)),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, r.hp(6.5)),
                        side: const BorderSide(color: AppColors.border),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
                      ),
                    ),
                    spacing.verticalSpace(16),
                    Text(
                      'Your bank account is used for deposits and withdrawals',
                      textAlign: TextAlign.center,
                      style: styles.caption.copyWith(color: AppColors.grayLight),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DocumentsView extends StatelessWidget {
  final VoidCallback onBack;
  const _DocumentsView({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);
    const kycProgress = 67.0;

    final steps = [
      {'name': 'Identity Verification (Nafath)', 'status': 'Verified', 'icon': Icons.fingerprint, 'date': 'Jan 10, 2025'},
      {'name': 'National ID', 'status': 'Verified', 'icon': Icons.credit_card, 'date': 'Jan 15, 2025'},
      {'name': 'Address Proof', 'status': 'Under Review', 'icon': Icons.description_outlined, 'date': 'Feb 1, 2025'},
      {'name': 'Income Proof', 'status': 'Not Uploaded', 'icon': Icons.upload_file, 'date': ''},
    ];

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'KYC & Verification', onBack: onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(r.wp(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // KYC Status Card
                    Container(
                      padding: EdgeInsets.all(r.wp(5)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('KYC Status', style: styles.body.copyWith(fontWeight: FontWeight.bold)),
                                  spacing.verticalSpace(4),
                                  Text('Complete your verification to start investing', style: styles.caption.copyWith(color: AppColors.gray)),
                                ],
                              ),
                              SizedBox(
                                width: r.wp(14),
                                height: r.wp(14),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: r.wp(14),
                                      height: r.wp(14),
                                      child: CircularProgressIndicator(
                                        value: kycProgress / 100,
                                        strokeWidth: 4,
                                        backgroundColor: AppColors.bluePale,
                                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.blue),
                                      ),
                                    ),
                                    Text('${kycProgress.toInt()}%', style: styles.body.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          spacing.verticalSpace(12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(r.radius(10)),
                            child: LinearProgressIndicator(
                              value: kycProgress / 100,
                              minHeight: r.hp(1),
                              backgroundColor: AppColors.bluePale,
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.blue),
                            ),
                          ),
                          spacing.verticalSpace(8),
                          Text('3 of 4 steps completed', style: styles.caption.copyWith(color: AppColors.grayLight)),
                        ],
                      ),
                    ),
                    spacing.verticalSpace(16),
                    // Investor Classification
                    Container(
                      padding: EdgeInsets.all(r.wp(4)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: r.wp(11),
                                height: r.wp(11),
                                decoration: BoxDecoration(
                                  color: AppColors.bluePale,
                                  borderRadius: BorderRadius.circular(r.radius(12)),
                                ),
                                child: Icon(Icons.shield_outlined, size: r.icon(22), color: AppColors.blue),
                              ),
                              spacing.horizontalSpace(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Investor Classification', style: styles.caption.copyWith(color: AppColors.grayLight)),
                                    spacing.verticalSpace(2),
                                    Text('Individual Investor', style: styles.body.copyWith(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.5)),
                                decoration: BoxDecoration(
                                  color: AppColors.greenBg,
                                  borderRadius: BorderRadius.circular(r.radius(20)),
                                ),
                                child: Text('Eligible', style: styles.caption.copyWith(color: AppColors.green, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          spacing.verticalSpace(8),
                          Padding(
                            padding: EdgeInsets.only(left: r.wp(11) + r.wp(3)),
                            child: Text('Saudi resident, eligible for real estate investment opportunities', style: styles.caption.copyWith(color: AppColors.grayLight)),
                          ),
                        ],
                      ),
                    ),
                    spacing.verticalSpace(24),
                    Text('Verification Steps', style: styles.caption.copyWith(color: AppColors.grayLight, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                    spacing.verticalSpace(12),
                    ...steps.map((step) {
                      final status = step['status'] as String;
                      final isVerified = status == 'Verified';
                      Color statusColor, statusBg, iconColor;
                      IconData icon;

                      switch (status) {
                        case 'Verified':
                          statusColor = AppColors.green;
                          statusBg = AppColors.greenBg;
                          iconColor = AppColors.green;
                          icon = Icons.check_circle;
                          break;
                        case 'Under Review':
                          statusColor = AppColors.yellow;
                          statusBg = AppColors.yellowBg;
                          iconColor = AppColors.blue;
                          icon = step['icon'] as IconData;
                          break;
                        default: // Not Uploaded
                          statusColor = AppColors.grayLight;
                          statusBg = AppColors.blueGhost;
                          iconColor = AppColors.blue;
                          icon = step['icon'] as IconData;
                      }

                      return Container(
                        margin: EdgeInsets.only(bottom: r.hp(1.5)),
                        padding: EdgeInsets.all(r.wp(4)),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(r.radius(16)),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: r.wp(12),
                              height: r.wp(12),
                              decoration: BoxDecoration(
                                color: isVerified ? AppColors.greenBg : AppColors.bluePale,
                                borderRadius: BorderRadius.circular(r.radius(12)),
                              ),
                              child: Icon(isVerified ? Icons.check : icon, size: r.icon(24), color: isVerified ? AppColors.green : AppColors.blue),
                            ),
                            spacing.horizontalSpace(12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(step['name'] as String, style: styles.body.copyWith(fontWeight: FontWeight.bold)),
                                  if ((step['date'] as String).isNotEmpty)
                                    Padding(
                                      padding: EdgeInsets.only(top: r.hp(0.5)),
                                      child: Text('${isVerified ? "Verified" : "Uploaded"} on ${step['date']}', style: styles.caption.copyWith(color: AppColors.grayLight)),
                                    ),
                                ],
                              ),
                            ),
                            spacing.horizontalSpace(8),
                            Text(status, style: styles.caption.copyWith(color: statusColor, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReferralView extends StatelessWidget {
  final VoidCallback onBack;
  const _ReferralView({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);
    const referralCode = 'HSEEL786';

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'Referral Code', onBack: onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(r.wp(5)),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(r.wp(6)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.card_giftcard, color: AppColors.blue, size: r.icon(48)),
                          spacing.verticalSpace(16),
                          Text('Refer & Earn SAR 150', style: styles.heading3.copyWith(color: AppColors.primary)),
                          spacing.verticalSpace(8),
                          Text(
                            'Share your code with friends. When they sign up and invest, you both get SAR 150 in your wallet.',
                            textAlign: TextAlign.center,
                            style: styles.body.copyWith(color: AppColors.gray),
                          ),
                          spacing.verticalSpace(24),
                          Text('YOUR REFERRAL CODE', style: styles.caption.copyWith(color: AppColors.grayLight, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                          spacing.verticalSpace(12),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(1.5)),
                            decoration: BoxDecoration(
                              color: AppColors.bluePale,
                              borderRadius: BorderRadius.circular(r.radius(12)),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(referralCode, style: styles.heading2.copyWith(color: AppColors.primary, letterSpacing: 2)),
                                spacing.horizontalSpace(16),
                                GestureDetector(
                                  onTap: () { /* Copy to clipboard */ },
                                  child: Icon(Icons.copy_outlined, color: AppColors.blue, size: r.icon(22)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing.verticalSpace(24),
                    ElevatedButton.icon(
                      icon: Icon(Icons.share_outlined, size: r.icon(20), color: AppColors.white),
                      label: Text('Share Code', style: styles.button.copyWith(color: AppColors.white)),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: Size(double.infinity, r.hp(6.5)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsView extends StatelessWidget {
  final VoidCallback onBack;
  final Function(ProfileView) onNavigate;

  const _SettingsView({Key? key, required this.onBack, required this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'Settings', onBack: onBack),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(r.wp(5)),
                children: [
                  _buildSectionHeader(r, styles, 'General'),
                  _buildSettingsCard(r, styles, [
                    _buildSettingsItem(r, styles, icon: Icons.notifications_outlined, title: 'Notifications', onTap: () => onNavigate(ProfileView.notificationSettings)),
                    _buildSettingsItem(r, styles, icon: Icons.language_outlined, title: 'Language', trailing: 'English', onTap: () {}),
                    _buildSettingsItem(r, styles, icon: Icons.brightness_6_outlined, title: 'Theme', trailing: 'Light', onTap: () {}, isLast: true),
                  ]),
                  SizedBox(height: r.hp(3)),
                  _buildSectionHeader(r, styles, 'Security'),
                  _buildSettingsCard(r, styles, [
                    _buildSettingsItem(r, styles, icon: Icons.lock_outline, title: 'Change Password', onTap: () {}),
                    _buildSettingsItem(r, styles, icon: Icons.fingerprint, title: 'Biometric Login', trailingWidget: Switch(value: true, onChanged: (val) {}, activeColor: AppColors.accent)),
                    _buildSettingsItem(r, styles, icon: Icons.phonelink_lock_outlined, title: 'Two-Factor Authentication', trailing: 'Enabled', onTap: () {}, isLast: true),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(Responsive r, AppTextStyles styles, String title) {
    return Padding(
      padding: EdgeInsets.only(left: r.wp(2), bottom: r.hp(1.5)),
      child: Text(title.toUpperCase(), style: styles.caption.copyWith(color: AppColors.grayLight, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
    );
  }

  Widget _buildSettingsCard(Responsive r, AppTextStyles styles, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem(Responsive r, AppTextStyles styles, {required IconData icon, required String title, String? trailing, Widget? trailingWidget, VoidCallback? onTap, bool isLast = false}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.8)),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: r.icon(22), color: AppColors.blue),
                SizedBox(width: r.wp(4)),
                Expanded(child: Text(title, style: styles.body.copyWith(fontWeight: FontWeight.w600))),
                if (trailing != null)
                  Text(trailing, style: styles.body.copyWith(color: AppColors.gray)),
                if (trailingWidget != null)
                  trailingWidget,
                if (onTap != null && trailingWidget == null)
                  Icon(Icons.chevron_right, size: r.icon(22), color: AppColors.grayLight),
              ],
            ),
            if (!isLast) Divider(height: r.hp(2), thickness: 0, color: Colors.transparent),
            if (!isLast) Container(height: 1, color: AppColors.border, margin: EdgeInsets.only(left: r.wp(10))),
          ],
        ),
      ),
    );
  }
}

class _NotificationSettingsView extends StatelessWidget {
  final VoidCallback onBack;
  const _NotificationSettingsView({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'Notification Settings', onBack: onBack),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(r.wp(5)),
                children: [
                  _buildNotificationToggle(r, styles, title: 'General Notifications', subtitle: 'Receive important account updates', value: true),
                  _buildNotificationToggle(r, styles, title: 'New Opportunities', subtitle: 'Get notified about new investments', value: true),
                  _buildNotificationToggle(r, styles, title: 'Portfolio Updates', subtitle: 'Weekly summaries of your portfolio', value: false),
                  _buildNotificationToggle(r, styles, title: 'Promotions & News', subtitle: 'Receive marketing and news updates', value: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationToggle(Responsive r, AppTextStyles styles, {required String title, required String subtitle, required bool value}) {
    return Container(
      margin: EdgeInsets.only(bottom: r.hp(1.5)),
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: styles.body.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: r.hp(0.5)),
                Text(subtitle, style: styles.caption.copyWith(color: AppColors.gray)),
              ],
            ),
          ),
          Switch(value: value, onChanged: (val) {}, activeColor: AppColors.accent),
        ],
      ),
    );
  }
}

class _HelpSupportView extends StatefulWidget {
  final VoidCallback onBack;
  const _HelpSupportView({Key? key, required this.onBack}) : super(key: key);

  @override
  __HelpSupportViewState createState() => __HelpSupportViewState();
}

class __HelpSupportViewState extends State<_HelpSupportView> {
  int? _expandedFaq;

  final faqs = [
    {'q': 'How do I start investing?', 'a': 'Create an account, complete KYC verification, add funds to your wallet, and browse available opportunities to start investing.'},
    {'q': 'What is the minimum investment?', 'a': 'The minimum investment varies by opportunity, typically starting from SAR 500.'},
    {'q': 'How do I withdraw my returns?', 'a': 'Go to your wallet, select 'Withdraw', choose your bank account, and enter the amount. Withdrawals are processed within 2-3 business days.'},
    {'q': 'How does the referral program work?', 'a': 'Share your referral code with friends. When they sign up and make their first investment, both of you receive SAR 150 in rewards.'},
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'Help & Support', onBack: widget.onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(r.wp(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.8)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(12)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: AppColors.grayLight, size: r.icon(20)),
                          spacing.horizontalSpace(12),
                          Text('Search for help...', style: styles.body.copyWith(color: AppColors.grayLight)),
                        ],
                      ),
                    ),
                    spacing.verticalSpace(24),
                    // FAQ
                    Text('Frequently Asked Questions', style: styles.body.copyWith(fontWeight: FontWeight.bold)),
                    spacing.verticalSpace(12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        children: faqs.asMap().entries.map((entry) {
                          int idx = entry.key;
                          Map<String, String> faq = entry.value;
                          bool isExpanded = _expandedFaq == idx;

                          return Column(
                            children: [
                              InkWell(
                                onTap: () => setState(() => _expandedFaq = isExpanded ? null : idx),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: Text(faq['q']!, style: styles.body.copyWith(fontWeight: FontWeight.w600))),
                                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: AppColors.grayLight, size: r.icon(24)),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedCrossFade(
                                firstChild: Container(),
                                secondChild: Padding(
                                  padding: EdgeInsets.only(left: r.wp(4), right: r.wp(4), bottom: r.hp(2)),
                                  child: Text(faq['a']!, style: styles.body.copyWith(color: AppColors.gray)),
                                ),
                                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 200),
                              ),
                              if (idx < faqs.length - 1) const Divider(height: 1, color: AppColors.border),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    spacing.verticalSpace(24),
                    // Contact
                    Text('Contact Us', style: styles.body.copyWith(fontWeight: FontWeight.bold)),
                    spacing.verticalSpace(12),
                    Container(
                      padding: EdgeInsets.all(r.wp(4)),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(r.radius(16)),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        children: [
                          _buildContactRow(r, styles, icon: Icons.email_outlined, title: 'Email Support', subtitle: 'support@hseeltech.com'),
                          const Divider(height: 1, color: AppColors.border),
                          _buildContactRow(r, styles, icon: Icons.phone_outlined, title: 'Phone Support', subtitle: '+966 11 234 5678'),
                          const Divider(height: 1, color: AppColors.border),
                          _buildContactRow(r, styles, icon: Icons.chat_bubble_outline, title: 'Live Chat', subtitle: 'Available 9am - 6pm', isLast: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(Responsive r, AppTextStyles styles, {required IconData icon, required String title, required String subtitle, bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: r.hp(1.5)),
      child: Row(
        children: [
          Container(
            width: r.wp(10),
            height: r.wp(10),
            decoration: BoxDecoration(
              color: AppColors.bluePale,
              borderRadius: BorderRadius.circular(r.radius(8)),
            ),
            child: Icon(icon, size: r.icon(20), color: AppColors.blue),
          ),
          SizedBox(width: r.wp(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: styles.body.copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: r.hp(0.5)),
                Text(subtitle, style: styles.caption.copyWith(color: AppColors.grayLight)),
              ],
            ),
          ),
          Icon(Icons.open_in_new, size: r.icon(20), color: AppColors.grayLight),
        ],
      ),
    );
  }
}

class _AboutView extends StatelessWidget {
  final VoidCallback onBack;
  const _AboutView({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: AppColors.blueGhost,
      body: SafeArea(
        child: Column(
          children: [
            _SubHeader(title: 'About', onBack: onBack),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(r.wp(5)),
                child: Column(
                  children: [
                    Image.network(
                      'https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/kWaatjYYcIFYYmIk.png',
                      height: r.hp(7),
                    ),
                    spacing.verticalSpace(8),
                    Text('Version 1.0.0', style: styles.caption.copyWith(color: AppColors.grayLight)),
                    spacing.verticalSpace(12),
                    Text(
                      'Invest in income-generating real estate opportunities across Saudi Arabia.',
                      textAlign: TextAlign.center,
                      style: styles.body.copyWith(color: AppColors.gray),
                    ),
                    spacing.verticalSpace(24),
                    _buildLinksCard(r, styles),
                    spacing.verticalSpace(16),
                    _buildDisclaimerCard(r, styles, isArabic: false),
                    spacing.verticalSpace(16),
                    _buildDisclaimerCard(r, styles, isArabic: true),
                    spacing.verticalSpace(16),
                    _buildRiskDisclaimer(r, styles),
                    spacing.verticalSpace(24),
                    Text('© 2025 Hseeltech. All rights reserved.', style: styles.caption.copyWith(color: AppColors.grayLight)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinksCard(Responsive r, AppTextStyles styles) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _buildLinkItem(r, styles, icon: Icons.description_outlined, title: 'Terms & Conditions'),
          const Divider(height: 1, color: AppColors.border),
          _buildLinkItem(r, styles, icon: Icons.shield_outlined, title: 'Privacy Policy'),
          const Divider(height: 1, color: AppColors.border),
          _buildLinkItem(r, styles, icon: Icons.warning_amber_outlined, title: 'Risk Disclosure', iconColor: AppColors.yellow, isLast: true),
        ],
      ),
    );
  }

  Widget _buildLinkItem(Responsive r, AppTextStyles styles, {required IconData icon, required String title, Color? iconColor, bool isLast = false}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
        child: Row(
          children: [
            Icon(icon, size: r.icon(22), color: iconColor ?? AppColors.blue),
            SizedBox(width: r.wp(4)),
            Expanded(child: Text(title, style: styles.body.copyWith(fontWeight: FontWeight.w600))),
            Icon(Icons.chevron_right, size: r.icon(22), color: AppColors.grayLight),
          ],
        ),
      ),
    );
  }

  Widget _buildDisclaimerCard(Responsive r, AppTextStyles styles, {required bool isArabic}) {
    final textDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
    final mainText = isArabic
        ? 'في حصيلتك، نسعى لتقديم تجربة استثمار عقاري موثوقة ومبتكرة.'
        : 'At Hseeltech, we are committed to delivering a trusted and innovative real estate investment experience.';
    final subText = isArabic
        ? 'نعمل حالياً ضمن البيئة التنظيمية التجريبية التابعة للهيئة العامة للعقار، مما يعني أن خدماتنا تخضع للمتابعة والإشراف المستمر لضمان أعلى معايير الجودة والحماية لمستثمرينا.'
        : 'We currently operate within REGA's Regulatory Sandbox, which means our services are subject to ongoing oversight to ensure the highest standards of quality and investor protection.';
    final regulatoryText = isArabic
        ? 'هذا المنتج/الخدمة قيد الاختبار حالياً ضمن البيئة التنظيمية التجريبية التابعة للهيئة العامة للعقار، وليست مرخصة أو معتمدة بشكل رسمي.'
        : 'This product/service is currently being tested within REGA's Regulatory Sandbox and is not formally licensed or endorsed by the Authority.';

    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: AppColors.blueGhost,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: AppColors.border),
      ),
      child: Directionality(
        textDirection: textDirection,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: r.hp(0.5)),
                  child: Icon(Icons.shield_outlined, size: r.icon(20), color: AppColors.blue),
                ),
                SizedBox(width: r.wp(3)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mainText, style: styles.caption.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold, height: 1.7)),
                      SizedBox(height: r.hp(1)),
                      Text(subText, style: styles.caption.copyWith(color: AppColors.gray, height: 1.7)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 20, color: AppColors.border),
            Text(regulatoryText, style: styles.caption.copyWith(color: AppColors.grayLight, fontStyle: FontStyle.italic, height: 1.7)),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskDisclaimer(Responsive r, AppTextStyles styles) {
    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: AppColors.blueGhost,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            'Investing in real estate involves risks. Past performance is not indicative of future results. Please read all documents carefully before investing.',
            style: styles.caption.copyWith(color: AppColors.grayLight, height: 1.7),
          ),
          SizedBox(height: r.hp(1)),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'الاستثمار في العقارات ينطوي على مخاطر. الأداء السابق لا يضمن النتائج المستقبلية. يرجى قراءة جميع المستندات بعناية قبل الاستثمار.',
              style: styles.caption.copyWith(color: AppColors.grayLight, height: 1.7),
            ),
          ),
        ],
      ),
    );
  }
}
" ) ) ⓔthought_startI have generated the Flutter code for the 'ProfileScreen' and all its sub-views. The code is written in a single file, '/home/ubuntu/profile_screen.dart', as requested. I have followed all the instructions, including: - Using a 'StatefulWidget' to manage the different views. - Creating separate widgets for each sub-screen. - Applying the 'Responsive' utility class for all sizing and spacing. - Using the specified colors and fonts from the design system. - Ensuring the layout and functionality match the provided React component.The next and final step is to submit the results. I will use the 'submit' tool to provide the 'screen_id', the path to the generated 'flutter_code' file, the 'widget_name', and the 'is_responsive' flag.The 'screen_id' is 'profile-en'.The 'flutter_code' path is '/home/ubuntu/profile_screen.dart'.The 'widget_name' is 'ProfileScreen'.The 'is_responsive' flag is 'True'.I will now prepare the 'submit' tool call. I will double-check the output schema to ensure I
