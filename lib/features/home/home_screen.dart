import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/widgets/bottom_nav.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Assuming AppTextStyles and AppSpacing are defined elsewhere
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
  TextStyle get body => TextStyle(fontSize: r.sp(16), color: const Color(0xFF1B2A4A));
  TextStyle get bodyBold => TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);

  EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: r.wp(5));
}

class HomeEnglishScreen extends StatefulWidget {
  const HomeEnglishScreen({Key? key}) : super(key: key);

  @override
  _HomeEnglishScreenState createState() => _HomeEnglishScreenState();
}

class _HomeEnglishScreenState extends State<HomeEnglishScreen> {
  void _navigateTo(String route) {
    // In a real app, you would use Navigator.pushNamed(context, route);
    print("Navigating to $route");
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(r, styles)),
            SliverPadding(
              padding: EdgeInsets.all(r.wp(5)),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildQuickActions(r, styles),
                  r.verticalSpace(20),
                  _buildOpportunities(r, styles),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(activeTab: 'home'),
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles) {
    return Container(
      padding: EdgeInsets.only(top: r.hp(7), left: r.wp(5), right: r.wp(5), bottom: r.hp(3)),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B2A4A), Color(0xFF2E5090)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          _buildTopBar(r, styles),
          r.verticalSpace(20),
          _buildPortfolioCard(r, styles),
        ],
      ),
    );
  }

  Widget _buildTopBar(Responsive r, AppTextStyles styles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back 👋',
              style: TextStyle(fontSize: r.sp(11), color: Colors.white.withOpacity(0.6)),
            ),
            Text(
              'Mohammed Al-Abdullah',
              style: TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r.radius(8)),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.75)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(r.radius(6)),
                    ),
                    child: Text('EN', style: TextStyle(fontSize: r.sp(11), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A))),
                  ),
                  GestureDetector(
                    onTap: () => _navigateTo('/home-ar'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.75)),
                      child: Text('AR', style: TextStyle(fontSize: r.sp(11), fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.6))),
                    ),
                  ),
                ],
              ),
            ),
            r.horizontalSpace(12),
            Stack(
              children: [
                Container(
                  width: r.icon(40),
                  height: r.icon(40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.notifications, color: Colors.white, size: r.icon(18)),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: r.wp(3),
                    height: r.wp(3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF2E5090), width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPortfolioCard(Responsive r, AppTextStyles styles) {
    return Container(
      padding: EdgeInsets.all(r.wp(5)),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Portfolio Value',
            style: TextStyle(fontSize: r.sp(11), color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600),
          ),
          r.verticalSpace(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('125,400', style: TextStyle(fontSize: r.sp(34), fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1)),
              r.horizontalSpace(8),
              Row(
                children: [
                  SvgPicture.network(
                    'https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/VJQgRtWSoUGGTVqb.svg',
                    width: r.icon(14),
                    height: r.icon(14),
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  r.horizontalSpace(4),
                  Text('SAR', style: TextStyle(fontSize: r.sp(16), fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.6))),
                ],
              ),
            ],
          ),
          r.verticalSpace(16),
          Divider(color: Colors.white.withOpacity(0.15)),
          r.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricItem(r, 'Monthly Return', '+2,450', isRiyal: true),
              Container(width: 1, height: r.hp(4), color: Colors.white.withOpacity(0.15)),
              _buildMetricItem(r, 'Expected Annual Return', '+8.37%'),
              Container(width: 1, height: r.hp(4), color: Colors.white.withOpacity(0.15)),
              _buildMetricItem(r, 'Investments', '3', isWhite: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(Responsive r, String label, String value, {bool isRiyal = false, bool isWhite = false}) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: r.sp(9), color: Colors.white.withOpacity(0.5))),
        r.verticalSpace(4),
        Row(
          children: [
            Text(value, style: TextStyle(fontSize: r.sp(13), fontWeight: FontWeight.bold, color: isWhite ? Colors.white : const Color(0xFF6EE7B7))),
            if (isRiyal)
              Padding(
                padding: EdgeInsets.only(left: r.wp(1)),
                child: SvgPicture.network(
                  'https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/VJQgRtWSoUGGTVqb.svg',
                  width: r.icon(10),
                  height: r.icon(10),
                  colorFilter: const ColorFilter.mode(Color(0xFF6EE7B7), BlendMode.srcIn),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActions(Responsive r, AppTextStyles styles) {
    final actions = [
      {'label': 'Deposit', 'icon': Icons.add},
      {'label': 'Withdraw', 'icon': Icons.remove},
      {'label': 'Wallet', 'icon': Icons.account_balance_wallet},
      {'label': 'More', 'icon': Icons.more_horiz},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: actions.map((action) {
        return Column(
          children: [
            Container(
              width: r.icon(56),
              height: r.icon(56),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Icon(action['icon'] as IconData, size: r.icon(20), color: const Color(0xFF1B2A4A)),
            ),
            r.verticalSpace(8),
            Text(action['label'] as String, style: TextStyle(fontSize: r.sp(10), fontWeight: FontWeight.w500, color: const Color(0xFF6B7280))),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildOpportunities(Responsive r, AppTextStyles styles) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Available Opportunities', style: styles.bodyBold.copyWith(fontSize: r.sp(16))),
            GestureDetector(
              onTap: () => _navigateTo('/opportunity-card'),
              child: Text('View All', style: TextStyle(fontSize: r.sp(12), fontWeight: FontWeight.w600, color: const Color(0xFF2E5090))),
            ),
          ],
        ),
        r.verticalSpace(12),
        SizedBox(
          height: r.hp(35),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildOpportunityCard(r, styles, 'Al Olaya Towers', 'Al Olaya, Riyadh 🇸🇦', '74%', 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400&h=250&fit=crop'),
              r.horizontalSpace(12),
              _buildOpportunityCard(r, styles, 'Al Faisaliah Tower', 'King Fahd Rd, Riyadh 🇸🇦', '45%', 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=250&fit=crop', isFaisaliah: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOpportunityCard(Responsive r, AppTextStyles styles, String title, String location, String funded, String imageUrl, {bool isFaisaliah = false}) {
    return GestureDetector(
      onTap: () => _navigateTo('/detail'),
      child: Container(
        width: r.wp(70),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(r.radius(16)),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(r.radius(16)), topRight: Radius.circular(r.radius(16))),
                  child: Image.network(imageUrl, height: r.hp(15), width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: r.hp(1),
                  left: r.wp(2),
                  child: Row(
                    children: [
                      _buildTag('Available', const Color(0xFF2D6A4F), r),
                      if (!isFaisaliah) ...[
                        r.horizontalSpace(6),
                        _buildTag('Residential', const Color(0xFF2E5090), r),
                      ]
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(r.wp(3.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: styles.bodyBold.copyWith(fontSize: r.sp(14))),
                  r.verticalSpace(2),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: const Color(0xFF9CA3AF), size: r.icon(12)),
                      r.horizontalSpace(4),
                      Text(location, style: TextStyle(fontSize: r.sp(10), color: const Color(0xFF9CA3AF))),
                    ],
                  ),
                  r.verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCardMetric(r, isFaisaliah ? '9.2%' : '8.37%', 'Expected Annual Return'),
                      _buildCardMetric(r, isFaisaliah ? '6.8%' : '7.2%', 'Net Yield'),
                      _buildCardMetric(r, 'Quarterly', 'Distribution'),
                    ],
                  ),
                  r.verticalSpace(12),
                  Row(
                    children: [
                      _buildSpec(r, Icons.king_bed, isFaisaliah ? '4 Rooms' : '2 Beds'),
                      r.horizontalSpace(12),
                      _buildSpec(r, Icons.bathtub, isFaisaliah ? '3 Baths' : '2 Baths'),
                      r.horizontalSpace(12),
                      _buildSpec(r, Icons.fullscreen, isFaisaliah ? '220 sqm' : '150 sqm'),
                    ],
                  ),
                  r.verticalSpace(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(
                        value: double.parse(funded.replaceAll('%', '')) / 100,
                        backgroundColor: const Color(0xFFEDF2F9),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E5090)),
                        minHeight: r.hp(1),
                      ),
                      r.verticalSpace(4),
                      Text('$funded Funded', style: TextStyle(fontSize: r.sp(9), fontWeight: FontWeight.w600, color: const Color(0xFF2D6A4F))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color, Responsive r) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(2.5), vertical: r.hp(0.5)),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(r.radius(12)),
      ),
      child: Text(text, style: TextStyle(fontSize: r.sp(9), fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget _buildCardMetric(Responsive r, String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: r.sp(14), fontWeight: FontWeight.w800, color: const Color(0xFF1B2A4A))),
        Text(label, style: TextStyle(fontSize: r.sp(8), color: const Color(0xFF9CA3AF))),
      ],
    );
  }

  Widget _buildSpec(Responsive r, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: r.icon(12), color: const Color(0xFF9CA3AF)),
        r.horizontalSpace(4),
        Text(text, style: TextStyle(fontSize: r.sp(9), color: const Color(0xFF9CA3AF))),
      ],
    );
  }
}
