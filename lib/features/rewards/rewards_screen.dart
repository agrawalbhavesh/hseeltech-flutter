import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum RewardsView { main, learn, tiers, earnings, policy }

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  RewardsView _currentView = RewardsView.main;

  void _setView(RewardsView view) {
    setState(() {
      _currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _buildCurrentView(r),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Corresponds to Rewards
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1B2A4A),
        unselectedItemColor: const Color(0xFF6B7280),
        selectedFontSize: r.sp(10),
        unselectedFontSize: r.sp(10),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: r.icon(24)), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart, size: r.icon(24)), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.explore, size: r.icon(24)), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.star, size: r.icon(24)), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: r.icon(24)), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildCurrentView(Responsive r) {
    switch (_currentView) {
      case RewardsView.learn:
        return _LearnTiersView(r: r, onBack: () => _setView(RewardsView.main), onViewTiers: () => _setView(RewardsView.tiers));
      case RewardsView.tiers:
        return _TiersDetailView(r: r, onBack: () => _setView(RewardsView.main));
      case RewardsView.earnings:
        return _EarningsView(r: r, onBack: () => _setView(RewardsView.main));
      case RewardsView.policy:
        return _PolicyView(r: r, onBack: () => _setView(RewardsView.main));
      case RewardsView.main:
      default:
        return _MainRewardsView(r: r, setView: _setView);
    }
  }
}

// Mock Data
class Tier {
  final String id;
  final String nameEn;
  final String fullNameEn;
  final IconData icon;
  final IconData iconSmall;
  final Color color;
  final Color bgColor;
  final int referrals;
  final List<String> benefits;
  final String message;

  const Tier({
    required this.id,
    required this.nameEn,
    required this.fullNameEn,
    required this.icon,
    required this.iconSmall,
    required this.color,
    required this.bgColor,
    required this.referrals,
    required this.benefits,
    required this.message,
  });
}

final List<Tier> TIERS = [
  Tier(
    id: "launch",
    nameEn: "Launch",
    fullNameEn: "Launch (Al-Iitlaq)",
    icon: Icons.rocket_launch,
    iconSmall: Icons.rocket_launch,
    color: const Color(0xFF2E5090),
    bgColor: const Color(0xFFEDF2F9),
    referrals: 2,
    benefits: ["Unlock access to investment opportunities", "Access to referral program"],
    message: "Start investing to upgrade your tier",
  ),
  Tier(
    id: "pioneer",
    nameEn: "Pioneer",
    fullNameEn: "Pioneer (Al-Raed)",
    icon: Icons.flag,
    iconSmall: Icons.flag,
    color: const Color(0xFF10B981),
    bgColor: const Color(0xFFECFDF5),
    referrals: 5,
    benefits: ["Early notifications of new listings"],
    message: "Your actions are inspiring others",
  ),
  Tier(
    id: "broker",
    nameEn: "Broker",
    fullNameEn: "Broker (Al-Simsar)",
    icon: Icons.handshake,
    iconSmall: Icons.handshake,
    color: const Color(0xFFF59E0B),
    bgColor: const Color(0xFFFFFBEB),
    referrals: 10,
    benefits: ["Priority access to select deals", "Bonus referral rewards"],
    message: "Your market presence is growing",
  ),
  Tier(
    id: "aqili",
    nameEn: "Aqili",
    fullNameEn: "Aqili (Al-Oqail)",
    icon: Icons.workspace_premium,
    iconSmall: Icons.workspace_premium,
    color: const Color(0xFF8B5CF6),
    bgColor: const Color(0xFFF5F3FF),
    referrals: 20,
    benefits: ["Access to exclusive real estate deals", "Priority customer support"],
    message: "You've influenced many investors",
  ),
  Tier(
    id: "distinguished",
    nameEn: "Distinguished",
    fullNameEn: "Distinguished (Al-Wajeeh)",
    icon: Icons.diamond,
    iconSmall: Icons.diamond,
    color: const Color(0xFFEC4899),
    bgColor: const Color(0xFFFDF2F8),
    referrals: 35,
    benefits: ["Dedicated relationship manager", "Invitations to private investment rounds"],
    message: "One of the platform's top investors",
  ),
];

// Main View
class _MainRewardsView extends StatelessWidget {
  final Responsive r;
  final Function(RewardsView) setView;
  const _MainRewardsView({required this.r, required this.setView});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);
    final currentTier = TIERS[0];

    return Column(
      children: [
        // Header
        Padding(
          padding: EdgeInsets.only(left: r.wp(5), right: r.wp(5), top: r.hp(2), bottom: r.hp(1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: r.wp(10),
                    height: r.wp(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/nVPNiXsDybqjvrMx.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  r.horizontalSpace(8),
                  Text("Rewards", style: styles.heading2.copyWith(color: const Color(0xFF1B1B1B))),
                ],
              ),
              GestureDetector(
                onTap: () => setView(RewardsView.learn),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: r.wp(3.5), vertical: r.hp(1)),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                    borderRadius: BorderRadius.circular(r.radius(20)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, size: r.icon(16), color: const Color(0xFF6B7280)),
                      r.horizontalSpace(4),
                      Text("Learn about tiers", style: styles.small.copyWith(color: const Color(0xFF6B7280), fontWeight: FontWeight.w500)),
                      Icon(Icons.arrow_forward_ios, size: r.icon(14), color: const Color(0xFF9CA3AF)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(2)),
            children: [
              // Current Tier Card
              Container(
                padding: EdgeInsets.all(r.wp(4)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(r.radius(16)),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: r.wp(12),
                          height: r.wp(12),
                          decoration: BoxDecoration(
                            color: currentTier.bgColor,
                            borderRadius: BorderRadius.circular(r.radius(12)),
                          ),
                          child: Icon(currentTier.iconSmall, size: r.icon(20), color: currentTier.color),
                        ),
                        r.horizontalSpace(12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: styles.body.copyWith(color: const Color(0xFF1B1B1B), fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: currentTier.fullNameEn),
                                    TextSpan(text: " tier", style: styles.body.copyWith(color: const Color(0xFF6B7280), fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: r.icon(16), color: const Color(0xFF9CA3AF)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    r.verticalSpace(12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(r.radius(10)),
                      child: LinearProgressIndicator(
                        value: 0.15,
                        backgroundColor: const Color(0xFFEDF2F9),
                        valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF2E5090)),
                        minHeight: r.hp(1),
                      ),
                    ),
                    r.verticalSpace(8),
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, size: r.icon(14), color: const Color(0xFF2E5090)),
                        r.horizontalSpace(6),
                        Text(currentTier.message, style: styles.small.copyWith(color: const Color(0xFF2E5090), fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
              r.verticalSpace(16),
              // My Earnings
              _buildNavCard(r, styles, "My earnings", "SAR 0", () => setView(RewardsView.earnings)),
              r.verticalSpace(16),
              // Refer and Earn
              Container(
                padding: EdgeInsets.all(r.wp(5)),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF2F9),
                  borderRadius: BorderRadius.circular(r.radius(16)),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: r.wp(10),
                              height: r.wp(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B2A4A).withOpacity(0.12),
                                borderRadius: BorderRadius.circular(r.radius(12)),
                              ),
                              child: Icon(Icons.card_giftcard, size: r.icon(20), color: const Color(0xFF1B2A4A)),
                            ),
                            r.horizontalSpace(12),
                            Text("Refer and earn", style: styles.body.copyWith(color: const Color(0xFF1B2A4A), fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios, size: r.icon(20), color: const Color(0xFF1B2A4A)),
                      ],
                    ),
                    r.verticalSpace(12),
                    Text(
                      "Join me on Hseeltech and receive SAR 150 instantly to invest in income-generating real estate! Let's grow our wealth together.",
                      style: styles.small.copyWith(color: const Color(0xFF3D5A80), height: 1.5),
                    ),
                    r.verticalSpace(16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.share, size: r.icon(16)),
                      label: Text("Share link"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B2A4A),
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, r.hp(6)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
                        textStyle: styles.body.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              r.verticalSpace(16),
              // Reward Policy
              _buildIconNavCard(r, styles, Icons.military_tech, "Reward Policy", () => setView(RewardsView.policy)),
              r.verticalSpace(24),
              // Tier Levels
              Padding(
                padding: EdgeInsets.symmetric(horizontal: r.wp(1)),
                child: Text(
                  "Tier Levels",
                  style: styles.small.copyWith(color: const Color(0xFF9CA3AF), fontWeight: FontWeight.bold, letterSpacing: 1.5),
                ),
              ),
              r.verticalSpace(12),
              ...TIERS.asMap().entries.map((entry) {
                int i = entry.key;
                Tier tier = entry.value;
                return Padding(
                  padding: EdgeInsets.only(bottom: r.hp(1)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(3.5), vertical: r.hp(1.5)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(r.radius(12)),
                      border: Border.all(color: i == 0 ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: r.wp(9),
                          height: r.wp(9),
                          decoration: BoxDecoration(
                            color: tier.bgColor,
                            borderRadius: BorderRadius.circular(r.radius(8)),
                          ),
                          child: Icon(tier.iconSmall, size: r.icon(20), color: tier.color),
                        ),
                        r.horizontalSpace(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tier.fullNameEn, style: styles.small.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B)), overflow: TextOverflow.ellipsis),
                              Text("${tier.referrals}+ referrals • ${tier.benefits[0]}", style: styles.extraSmall.copyWith(color: const Color(0xFF9CA3AF)), overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        r.horizontalSpace(8),
                        if (i == 0)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.5)),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E5090).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(r.radius(20)),
                            ),
                            child: Text("Current", style: styles.extraSmall.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF2E5090))),
                          )
                        else
                          Icon(Icons.lock, size: r.icon(14), color: const Color(0xFF9CA3AF)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavCard(Responsive r, AppTextStyles styles, String title, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.8)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(r.radius(16)),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: styles.body.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B))),
            Row(
              children: [
                Text(value, style: styles.body.copyWith(fontWeight: FontWeight.w800, color: const Color(0xFF1B1B1B))),
                r.horizontalSpace(8),
                Icon(Icons.arrow_forward_ios, size: r.icon(16), color: const Color(0xFF9CA3AF)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconNavCard(Responsive r, AppTextStyles styles, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(r.radius(16)),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Container(
              width: r.wp(9),
              height: r.wp(9),
              decoration: BoxDecoration(
                color: const Color(0xFFEDF2F9),
                borderRadius: BorderRadius.circular(r.radius(8)),
              ),
              child: Icon(icon, size: r.icon(16), color: const Color(0xFF2E5090)),
            ),
            r.horizontalSpace(12),
            Expanded(child: Text(title, style: styles.body.copyWith(fontWeight: FontWeight.w500, color: const Color(0xFF1B1B1B)))),
            Icon(Icons.arrow_forward_ios, size: r.icon(16), color: const Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}

// Generic Placeholder Views for sub-screens
class _LearnTiersView extends StatelessWidget {
  final Responsive r;
  final VoidCallback onBack;
  final VoidCallback onViewTiers;

  const _LearnTiersView({required this.r, required this.onBack, required this.onViewTiers});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final styles = AppTextStyles(r);
    final currentTier = TIERS[0];

    return Column(
      children: [
        // Header
        _buildSubScreenHeader(r, styles, "Learn", onBack),
        Expanded(
          child: Container(
            color: const Color(0xFFF8FAFC),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(2)),
              children: [
                Text("Unlock more with", style: styles.heading1.copyWith(color: const Color(0xFF1B1B1B))),
                Text(currentTier.fullNameEn, style: styles.heading1.copyWith(color: const Color(0xFF2E5090))),
                r.verticalSpace(12),
                Text("Unlock access to investment opportunities and referral program", style: styles.body.copyWith(color: const Color(0xFF6B7280))),
                r.verticalSpace(24),
                // Current Tier Card
                Container(
                  padding: EdgeInsets.all(r.wp(5)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(r.radius(16)),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: styles.body.copyWith(color: const Color(0xFF6B7280)),
                          children: [
                            TextSpan(text: "You're a "),
                            TextSpan(text: currentTier.fullNameEn, style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B))),
                            TextSpan(text: " member"),
                          ],
                        ),
                      ),
                      r.verticalSpace(12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(r.radius(10)),
                        child: LinearProgressIndicator(
                          value: 0.15,
                          backgroundColor: const Color(0xFFEDF2F9),
                          valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFF2E5090)),
                          minHeight: r.hp(1),
                        ),
                      ),
                      r.verticalSpace(12),
                      Row(
                        children: [
                          Icon(Icons.auto_awesome, size: r.icon(16), color: const Color(0xFF2E5090)),
                          r.horizontalSpace(8),
                          Text("Start investing to upgrade your tier", style: styles.small.copyWith(color: const Color(0xFF2E5090), fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
                r.verticalSpace(16),
                // Our Tiers Card
                GestureDetector(
                  onTap: onViewTiers,
                  child: Container(
                    padding: EdgeInsets.all(r.wp(4)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(r.radius(16)),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: r.wp(12),
                          height: r.wp(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDF2F9),
                            borderRadius: BorderRadius.circular(r.radius(12)),
                          ),
                          child: Icon(Icons.emoji_events, size: r.icon(24), color: const Color(0xFF2E5090)),
                        ),
                        r.horizontalSpace(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Our Tiers", style: styles.body.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B))),
                              Text("Learn about the benefits of each tier", style: styles.small.copyWith(color: const Color(0xFF6B7280))),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: r.icon(16), color: const Color(0xFF9CA3AF)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TiersDetailView extends StatefulWidget {
  final Responsive r;
  final VoidCallback onBack;

  const _TiersDetailView({required this.r, required this.onBack});

  @override
  __TiersDetailViewState createState() => __TiersDetailViewState();
}

class __TiersDetailViewState extends State<_TiersDetailView> {
  int _activeTierIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final styles = AppTextStyles(widget.r);
    final r = widget.r;
    final tier = TIERS[_activeTierIndex];

    return Column(
      children: [
        _buildSubScreenHeader(r, styles, "Tiers", widget.onBack),
        // Tier Tabs
        Container(
          height: r.hp(7),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1)),
            itemCount: TIERS.length,
            itemBuilder: (context, index) {
              final t = TIERS[index];
              final isActive = _activeTierIndex == index;
              return Padding(
                padding: EdgeInsets.only(right: r.wp(2)),
                child: ElevatedButton(
                  onPressed: () => setState(() => _activeTierIndex = index),
                  child: Text(t.fullNameEn, style: TextStyle(fontSize: r.sp(12), fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isActive ? const Color(0xFF1B2A4A) : Colors.white,
                    foregroundColor: isActive ? Colors.white : const Color(0xFF1B1B1B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(r.radius(20)),
                      side: BorderSide(color: isActive ? const Color(0xFF1B2A4A) : const Color(0xFFE2E8F0), width: 1.5),
                    ),
                    elevation: 0,
                  ),
                ),
              );
            },
          ),
        ),
        // Tier Content
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
            child: Container(
              key: ValueKey<String>(tier.id),
              margin: EdgeInsets.symmetric(horizontal: r.wp(4)),
              padding: EdgeInsets.all(r.wp(6)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F8FC),
                borderRadius: BorderRadius.circular(r.radius(16)),
              ),
              child: Column(
                children: [
                  Container(
                    width: r.wp(20),
                    height: r.wp(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(r.radius(16)),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
                    ),
                    child: Icon(tier.icon, size: r.icon(36), color: tier.color),
                  ),
                  r.verticalSpace(20),
                  Text(tier.fullNameEn, style: styles.heading3.copyWith(color: const Color(0xFF1B1B1B))),
                  r.verticalSpace(8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1)),
                    decoration: BoxDecoration(
                      color: tier.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(r.radius(20)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.group, size: r.icon(16), color: tier.color),
                        r.horizontalSpace(8),
                        Text("${tier.referrals}+ successful referrals", style: styles.small.copyWith(fontWeight: FontWeight.bold, color: tier.color)),
                      ],
                    ),
                  ),
                  r.verticalSpace(20),
                  ...tier.benefits.asMap().entries.map((entry) {
                    int i = entry.key;
                    String benefit = entry.value;
                    return Container(
                      margin: EdgeInsets.only(bottom: r.hp(1.5)),
                      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(r.radius(12)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: r.wp(8),
                            height: r.wp(8),
                            margin: EdgeInsets.only(top: r.hp(0.5)),
                            decoration: BoxDecoration(
                              color: tier.bgColor,
                              borderRadius: BorderRadius.circular(r.radius(8)),
                            ),
                            child: Icon(i == 0 ? Icons.shield : Icons.star, size: r.icon(16), color: tier.color),
                          ),
                          r.horizontalSpace(12),
                          Expanded(child: Text(benefit, style: styles.small.copyWith(color: const Color(0xFF1B1B1B), fontWeight: FontWeight.w500, height: 1.5))),
                        ],
                      ),
                    );
                  }).toList(),
                  const Spacer(),
                  // Tier Level Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: TIERS.asMap().entries.map((entry) {
                      int i = entry.key;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: r.wp(0.75)),
                        height: r.hp(0.75),
                        width: i == _activeTierIndex ? r.wp(6) : r.wp(2),
                        decoration: BoxDecoration(
                          color: i == _activeTierIndex ? tier.color : const Color(0xFF1B1B1B).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(r.radius(5)),
                        ),
                      );
                    }).toList(),
                  ),
                  r.verticalSpace(10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EarningsView extends StatelessWidget {
  final Responsive r;
  final VoidCallback onBack;

  const _EarningsView({required this.r, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final styles = AppTextStyles(r);
    return Column(
      children: [
        _buildSubScreenHeader(r, styles, "My Earnings", onBack),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_balance_wallet, size: r.icon(60), color: const Color(0xFF9CA3AF)),
                r.verticalSpace(20),
                Text("No Earnings Yet", style: styles.heading2),
                Text("Your earnings from referrals will appear here.", style: styles.body.copyWith(color: const Color(0xFF6B7280))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PolicyView extends StatelessWidget {
  final Responsive r;
  final VoidCallback onBack;

  const _PolicyView({required this.r, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final styles = AppTextStyles(r);
    return Column(
      children: [
        _buildSubScreenHeader(r, styles, "Reward Policy", onBack),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.policy, size: r.icon(60), color: const Color(0xFF9CA3AF)),
                r.verticalSpace(20),
                Text("Reward Policy", style: styles.heading2),
                Padding(
                  padding: EdgeInsets.all(r.wp(5)),
                  child: Text("Details about the reward policy will be displayed here.", style: styles.body.copyWith(color: const Color(0xFF6B7280)), textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildSubScreenHeader(Responsive r, AppTextStyles styles, String title, VoidCallback onBack) {
  return Container(
    padding: EdgeInsets.only(top: r.hp(2), bottom: r.hp(1.5), left: r.wp(5), right: r.wp(5)),
    color: Colors.white,
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: r.icon(20), color: const Color(0xFF1B1B1B)),
          onPressed: onBack,
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: styles.body.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B)),
          ),
        ),
        SizedBox(width: r.wp(12)), // To balance the back button
      ],
    ),
  );
}
