import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/widgets/app_text_styles.dart';
import 'package:hseeltech/widgets/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    const Color primaryColor = Color(0xFF1B2A4A);
    const Color accentColor = Color(0xFF2E7D32);
    const Color blueColor = Color(0xFF2E5090);
    const Color bluePaleColor = Color(0xFFEDF2F9);
    const Color grayLightColor = Color(0xFF9CA3AF);
    const Color borderColor = Color(0xFFE2E8F0);
    const Color darkColor = Color(0xFF1B1B1B);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(r, styles, spacing, primaryColor, blueColor),
              _buildBody(r, styles, spacing, primaryColor, accentColor, blueColor, bluePaleColor, grayLightColor, borderColor, darkColor),
            ],
          ),
        ),
      ),
      // Assuming a BottomNav widget exists
      // bottomNavigationBar: BottomNav(activeTab: 'portfolio'),
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles, AppSpacing spacing, Color primaryColor, Color blueColor) {
    return Container(
      padding: EdgeInsets.only(left: r.wp(5), right: r.wp(5), top: r.hp(7), bottom: r.hp(2.5)),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, blueColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Portfolio', style: styles.heading2.copyWith(color: Colors.white)),
          r.verticalSpace(16),
          _buildTotalValueCard(r, styles, spacing),
        ],
      ),
    );
  }

  Widget _buildTotalValueCard(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL VALUE',
            style: styles.caption.copyWith(color: Colors.white.withOpacity(0.5), letterSpacing: 1.2),
          ),
          r.verticalSpace(4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('134,135', style: styles.heading1.copyWith(color: Colors.white, fontSize: r.sp(28))),
              r.horizontalSpace(8),
              Text('SAR', style: styles.body.copyWith(color: Colors.white.withOpacity(0.6))),
            ],
          ),
          r.verticalSpace(12),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Invested', style: styles.caption.copyWith(color: Colors.white.withOpacity(0.4))),
                  Text('125,000 SAR', style: styles.body.copyWith(color: Colors.white)),
                ],
              ),
              r.horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Return', style: styles.caption.copyWith(color: Colors.white.withOpacity(0.4))),
                  Text('+9,135 SAR', style: styles.body.copyWith(color: const Color(0xFF4ADE80))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody(Responsive r, AppTextStyles styles, AppSpacing spacing, Color primaryColor, Color accentColor, Color blueColor, Color bluePaleColor, Color grayLightColor, Color borderColor, Color darkColor) {
    return Padding(
      padding: EdgeInsets.all(r.wp(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickStats(r, styles, spacing, primaryColor, accentColor, blueColor, bluePaleColor, borderColor, grayLightColor),
          r.verticalSpace(20),
          _buildUpcomingDistribution(r, styles, spacing, primaryColor, blueColor, bluePaleColor, accentColor, grayLightColor),
          r.verticalSpace(20),
          _buildPortfolioAllocation(r, styles, spacing, primaryColor, blueColor, bluePaleColor, darkColor, borderColor),
          r.verticalSpace(20),
          _buildInvestmentsList(r, styles, spacing, blueColor, bluePaleColor, accentColor, darkColor, borderColor, grayLightColor),
          r.verticalSpace(20),
          _buildPerformanceSummary(r, styles, spacing, primaryColor, blueColor, accentColor, darkColor, borderColor, grayLightColor),
        ],
      ),
    );
  }

  Widget _buildQuickStats(Responsive r, AppTextStyles styles, AppSpacing spacing, Color primaryColor, Color accentColor, Color blueColor, Color bluePaleColor, Color borderColor, Color grayLightColor) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            r, styles, spacing, bluePaleColor, borderColor, Icons.pie_chart,
            'Properties', '3', blueColor, primaryColor, grayLightColor
          ),
        ),
        r.horizontalSpace(12),
        Expanded(
          child: _buildStatCard(
            r, styles, spacing, bluePaleColor, borderColor, Icons.trending_up,
            'Avg Return', '7.5%', accentColor, accentColor, grayLightColor
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(Responsive r, AppTextStyles styles, AppSpacing spacing, Color bgColor, Color borderColor, IconData icon, String label, String value, Color iconColor, Color valueColor, Color labelColor) {
    return Container(
      padding: EdgeInsets.all(r.wp(3.5)),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(r.radius(12)),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: r.icon(16), color: iconColor),
              r.horizontalSpace(8),
              Text(label, style: styles.caption.copyWith(color: labelColor)),
            ],
          ),
          r.verticalSpace(8),
          Text(value, style: styles.heading3.copyWith(color: valueColor, fontSize: r.sp(20))),
        ],
      ),
    );
  }

  Widget _buildUpcomingDistribution(Responsive r, AppTextStyles styles, AppSpacing spacing, Color primaryColor, Color blueColor, Color bluePaleColor, Color accentColor, Color grayLightColor) {
    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [bluePaleColor, Color(0xFFE0EAFC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: const Color(0xFFC8D6E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, size: r.icon(16), color: blueColor),
              r.horizontalSpace(8),
              Text('Upcoming Distribution', style: styles.body.copyWith(color: primaryColor)),
            ],
          ),
          r.verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2,450 SAR', style: styles.heading3.copyWith(color: primaryColor, fontSize: r.sp(18))),
                  Text('Expected on March 15, 2026', style: styles.caption.copyWith(color: grayLightColor)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.75)),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(r.radius(8)),
                ),
                child: Text('In 33 days', style: styles.caption.copyWith(color: accentColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioAllocation(Responsive r, AppTextStyles styles, AppSpacing spacing, Color primaryColor, Color blueColor, Color bluePaleColor, Color darkColor, Color borderColor) {
    final allocations = [
      {'label': 'Residential', 'pct': 40.0, 'color': blueColor},
      {'label': 'Commercial', 'pct': 24.0, 'color': const Color(0xFF4A7BC7)},
      {'label': 'Hospitality', 'pct': 36.0, 'color': primaryColor},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Portfolio Allocation', style: styles.subheading.copyWith(color: darkColor)),
        r.verticalSpace(12),
        Container(
          padding: EdgeInsets.all(r.wp(4)),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F8FC),
            borderRadius: BorderRadius.circular(r.radius(16)),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            children: allocations.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: r.hp(0.75)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['label'] as String, style: styles.bodySmall.copyWith(color: darkColor, fontWeight: FontWeight.w600)),
                        Text('${item['pct']}% ', style: styles.bodySmall.copyWith(color: const Color(0xFF6B7280), fontWeight: FontWeight.bold)),
                      ],
                    ),
                    r.verticalSpace(4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(r.radius(10)),
                      child: LinearProgressIndicator(
                        value: (item['pct'] as double) / 100,
                        backgroundColor: bluePaleColor,
                        valueColor: AlwaysStoppedAnimation<Color>(item['color'] as Color),
                        minHeight: r.hp(1),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildInvestmentsList(Responsive r, AppTextStyles styles, AppSpacing spacing, Color blueColor, Color bluePaleColor, Color accentColor, Color darkColor, Color borderColor, Color grayLightColor) {
    final investments = [
      {
        'name': 'Al-Olaya Towers',
        'type': 'Residential',
        'currentValue': '54,185 SAR',
        'returnPct': '+8.37%',
        'tokens': 5,
        'img': 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=100&h=100&fit=crop',
      },
      {
        'name': 'King Fahd Business Park',
        'type': 'Commercial',
        'currentValue': '32,700 SAR',
        'returnPct': '+9.0%',
        'tokens': 3,
        'img': 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=100&h=100&fit=crop',
      },
      {
        'name': 'Jeddah Waterfront',
        'type': 'Hospitality',
        'currentValue': '47,250 SAR',
        'returnPct': '+5.0%',
        'tokens': 4,
        'img': 'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?w=100&h=100&fit=crop',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Investments', style: styles.subheading.copyWith(color: darkColor)),
        r.verticalSpace(12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: investments.length,
          separatorBuilder: (context, index) => r.verticalSpace(10),
          itemBuilder: (context, index) {
            final inv = investments[index];
            return Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(r.radius(16)),
              child: InkWell(
                onTap: () { /* Navigate to detail */ },
                borderRadius: BorderRadius.circular(r.radius(16)),
                child: Container(
                  padding: EdgeInsets.all(r.wp(3.5)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(r.radius(16)),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(r.radius(12)),
                        child: Image.network(
                          inv['img'] as String,
                          width: r.wp(14),
                          height: r.wp(14),
                          fit: BoxFit.cover,
                        ),
                      ),
                      r.horizontalSpace(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(inv['name'] as String, style: styles.body.copyWith(color: darkColor), overflow: TextOverflow.ellipsis),
                            r.verticalSpace(4),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.25)),
                                  decoration: BoxDecoration(
                                    color: bluePaleColor,
                                    borderRadius: BorderRadius.circular(r.radius(6)),
                                  ),
                                  child: Text(inv['type'] as String, style: styles.caption.copyWith(color: blueColor, fontSize: r.sp(8))),
                                ),
                                r.horizontalSpace(8),
                                Text('${inv['tokens']}' + ' tokens', style: styles.caption.copyWith(color: grayLightColor)),
                              ],
                            ),
                            r.verticalSpace(6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(inv['currentValue'] as String, style: styles.bodySmall.copyWith(color: darkColor, fontWeight: FontWeight.bold)),
                                Text(inv['returnPct'] as String, style: styles.bodySmall.copyWith(color: accentColor, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: const Color(0xFFD1D5DB), size: r.icon(20)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPerformanceSummary(Responsive r, AppTextStyles styles, AppSpacing spacing, Color primaryColor, Color blueColor, Color accentColor, Color darkColor, Color borderColor, Color grayLightColor) {
    final performanceItems = [
      {'label': 'Total Profit', 'value': '9,135 SAR', 'color': accentColor},
      {'label': 'Rental Income', 'value': '6,250 SAR', 'color': blueColor},
      {'label': 'Capital Gain', 'value': '2,885 SAR', 'color': const Color(0xFF4A7BC7)},
      {'label': 'Distributions Received', 'value': '4', 'color': primaryColor},
    ];

    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Performance Summary', style: styles.bodySmall.copyWith(color: darkColor, fontWeight: FontWeight.bold)),
          r.verticalSpace(12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: performanceItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: r.wp(3),
              mainAxisSpacing: r.hp(1.5),
              childAspectRatio: 2.2,
            ),
            itemBuilder: (context, index) {
              final item = performanceItems[index];
              return Container(
                padding: EdgeInsets.all(r.wp(3)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(r.radius(12)),
                  border: Border.all(color: borderColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['label'] as String, style: styles.caption.copyWith(color: grayLightColor)),
                    r.verticalSpace(4),
                    Text(item['value'] as String, style: styles.subheading.copyWith(color: item['color'] as Color, fontSize: r.sp(14))),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
" })) mischievous-sand-9599/portfolio_screen.dart", text=
