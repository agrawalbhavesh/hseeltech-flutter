import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// --- Mock Design System Classes (as per instructions) ---
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(18), fontWeight: FontWeight.w800, color: const Color(0xFF1B1B1B));
  TextStyle get cardTitle => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(14), fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B));
  TextStyle get body => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(12), color: const Color(0xFF6B7280));
  TextStyle get smallLabel => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(10), fontWeight: FontWeight.w500, color: const Color(0xFF9CA3AF));
  TextStyle get tag => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(9), fontWeight: FontWeight.bold);
  TextStyle get financialKey => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(12), fontWeight: FontWeight.w800, color: const Color(0xFF1B2A4A));
  TextStyle get financialLabel => TextStyle(fontFamily: 'Montserrat Arabic', fontSize: r.sp(8), fontWeight: FontWeight.w500, color: const Color(0xFF9CA3AF));
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);

  EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: r.wp(5));
}

// --- Data Model ---
class Opportunity {
  final String name;
  final String location;
  final String flag;
  final String type;
  final String strategy;
  final String status;
  final String price;
  final String annualReturn;
  final String rentalYield;
  final String distribution;
  final int fundedPct;
  final List<Map<String, dynamic>> facilities;
  final List<String> images;

  Opportunity({
    required this.name,
    required this.location,
    required this.flag,
    required this.type,
    required this.strategy,
    required this.status,
    required this.price,
    required this.annualReturn,
    required this.rentalYield,
    required this.distribution,
    required this.fundedPct,
    required this.facilities,
    required this.images,
  });
}

// --- Main Screen Widget ---
class OpportunityCardScreen extends StatelessWidget {
  const OpportunityCardScreen({super.key});

  static const C = {
    'navy': Color(0xFF1B2A4A),
    'blue': Color(0xFF2E5090),
    'blueLight': Color(0xFF4A7BC7),
    'bluePale': Color(0xFFEDF2F9),
    'green': Color(0xFF2D6A4F),
    'dark': Color(0xFF1B1B1B),
    'gray': Color(0xFF6B7280),
    'grayLight': Color(0xFF9CA3AF),
    'white': Color(0xFFFFFFFF),
    'border': Color(0xFFE2E8F0),
   };

  final _opportunities = const [
    {
      'name': 'Al-Olaya Towers',
      'location': 'Riyadh, Saudi Arabia',
      'flag': '🇸🇦',
      'type': 'Apartment',
      'strategy': 'High Yield',
      'status': 'Available',
      'price': '12,500,000 SAR',
      'annualReturn': '8.37%',
      'rentalYield': '7.2%',
      'distribution': 'Quarterly',
      'fundedPct': 74,
      'facilities': [
        {'icon': Icons.bed, 'label': '2 Bed'},
        {'icon': Icons.bathtub_outlined, 'label': '2 Bath'},
        {'icon': Icons.directions_car_outlined, 'label': '1 Parking'},
      ],
      'images': [
        'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=400&h=220&fit=crop',
      ],
    },
    {
      'name': 'King Fahd Business Park',
      'location': 'Riyadh, Saudi Arabia',
      'flag': '🇸🇦',
      'type': 'Office Space',
      'strategy': 'Growth',
      'status': 'Available',
      'price': '28,000,000 SAR',
      'annualReturn': '9.0%',
      'rentalYield': '6.8%',
      'distribution': 'Monthly',
      'fundedPct': 45,
      'facilities': [
        {'icon': Icons.business_center, 'label': '12 Rooms'},
        {'icon': Icons.directions_car_outlined, 'label': '8 Parking'},
      ],
      'images': [
        'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=400&h=220&fit=crop',
      ],
    },
    {
      'name': 'Jeddah Corniche Hotel',
      'location': 'Jeddah, Saudi Arabia',
      'flag': '🇸🇦',
      'type': 'Hotel',
      'strategy': 'Balanced',
      'status': 'Funded',
      'price': '45,000,000 SAR',
      'annualReturn': '7.5%',
      'rentalYield': '5.8%',
      'distribution': 'Quarterly',
      'fundedPct': 100,
      'facilities': [
        {'icon': Icons.bed, 'label': '120 Rooms'},
        {'icon': Icons.star_border, 'label': '4 Stars'},
      ],
      'images': [
        'https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?w=400&h=220&fit=crop',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: C['white'],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(r.wp(5), r.hp(2), r.wp(5), r.hp(1.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore Opportunities', style: styles.heading1),
                  r.verticalSpace(12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: r.wp(3.5), vertical: r.hp(1.2)),
                          decoration: BoxDecoration(
                            color: C['bluePale'],
                            borderRadius: BorderRadius.circular(r.radius(12)),
                            border: Border.all(color: C['border']!),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, size: r.icon(16), color: C['grayLight']),
                              r.horizontalSpace(8),
                              Text('Search properties...', style: styles.body.copyWith(color: C['grayLight'])),
                            ],
                          ),
                        ),
                      ),
                      r.horizontalSpace(8),
                      Container(
                        width: r.wp(10),
                        height: r.wp(10),
                        decoration: BoxDecoration(
                          color: C['bluePale'],
                          borderRadius: BorderRadius.circular(r.radius(12)),
                          border: Border.all(color: C['border']!),
                        ),
                        child: Icon(Icons.filter_list, size: r.icon(20), color: C['blue']),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(r.wp(5), r.hp(1), r.wp(5), r.hp(3)),
                itemCount: _opportunities.length,
                separatorBuilder: (context, index) => r.verticalSpace(16),
                itemBuilder: (context, index) {
                  final opp = Opportunity(
                    name: _opportunities[index]['name'] as String,
                    location: _opportunities[index]['location'] as String,
                    flag: _opportunities[index]['flag'] as String,
                    type: _opportunities[index]['type'] as String,
                    strategy: _opportunities[index]['strategy'] as String,
                    status: _opportunities[index]['status'] as String,
                    price: _opportunities[index]['price'] as String,
                    annualReturn: _opportunities[index]['annualReturn'] as String,
                    rentalYield: _opportunities[index]['rentalYield'] as String,
                    distribution: _opportunities[index]['distribution'] as String,
                    fundedPct: _opportunities[index]['fundedPct'] as int,
                    facilities: _opportunities[index]['facilities'] as List<Map<String, dynamic>>,
                    images: _opportunities[index]['images'] as List<String>,
                  );
                  return _OpportunityCard(opportunity: opp);
                },
              ),
            ),
          ],
        ),
      ),
      // Assuming a BottomNav widget exists as in the React code
      // bottomNavigationBar: BottomNav(activeTab: 'explore'),
    );
  }
}

// --- Opportunity Card Widget ---
class _OpportunityCard extends StatelessWidget {
  final Opportunity opportunity;
  const _OpportunityCard({required this.opportunity});

  static const C = OpportunityCardScreen.C;

  Color _getStatusColor(String status) {
    if (status == 'Available') return C['green']!;
    if (status == 'Funded') return C['blue']!;
    return C['grayLight']!;
  }

  Color _getStrategyColor(String strategy) {
    if (strategy == 'High Yield') return const Color(0xFFE74C3C);
    if (strategy == 'Growth') return C['blue']!;
    return const Color(0xFFF39C12);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return GestureDetector(
      onTap: () { /* Handle navigation */ },
      child: Container(
        decoration: BoxDecoration(
          color: C['white'],
          borderRadius: BorderRadius.circular(r.radius(16)),
          border: Border.all(color: C['border']!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Image Section ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(r.radius(16))),
                  child: Image.network(
                    opportunity.images.first,
                    width: double.infinity,
                    height: r.hp(20),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: r.hp(1.5),
                  left: r.wp(3),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.5)),
                    decoration: BoxDecoration(
                      color: _getStatusColor(opportunity.status),
                      borderRadius: BorderRadius.circular(r.radius(20)),
                    ),
                    child: Text(opportunity.status, style: styles.tag.copyWith(color: C['white'], fontSize: r.sp(10))),
                  ),
                ),
                Positioned(
                  top: r.hp(1.5),
                  right: r.wp(3),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(2.5), vertical: r.hp(0.5)),
                    decoration: BoxDecoration(
                      color: _getStrategyColor(opportunity.strategy).withOpacity(0.87),
                      borderRadius: BorderRadius.circular(r.radius(20)),
                    ),
                    child: Text(opportunity.strategy, style: styles.tag.copyWith(color: C['white'])),
                  ),
                ),
              ],
            ),
            // --- Content Section ---
            Padding(
              padding: EdgeInsets.all(r.wp(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(opportunity.name, style: styles.cardTitle),
                  r.verticalSpace(4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: r.icon(12), color: C['grayLight']),
                      r.horizontalSpace(4),
                      Text(opportunity.location, style: styles.body.copyWith(fontSize: r.sp(11), color: C['grayLight'])),
                      r.horizontalSpace(4),
                      Text(opportunity.flag, style: TextStyle(fontSize: r.sp(12))),
                    ],
                  ),
                  r.verticalSpace(12),
                  Wrap(
                    spacing: r.wp(2),
                    runSpacing: r.hp(1),
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: r.wp(2.5), vertical: r.hp(0.6)),
                        decoration: BoxDecoration(
                          color: C['bluePale'],
                          borderRadius: BorderRadius.circular(r.radius(8)),
                          border: Border.all(color: C['border']!),
                        ),
                        child: Text(opportunity.type, style: styles.tag.copyWith(color: C['navy'])),
                      ),
                      ...opportunity.facilities.map((f) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(f['icon'] as IconData, size: r.icon(12), color: C['blue']),
                          r.horizontalSpace(4),
                          Text(f['label'] as String, style: styles.body.copyWith(fontSize: r.sp(10))),
                        ],
                      )),
                    ],
                  ),
                  r.verticalSpace(12),
                  // --- Funding Progress ---
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Target: ${opportunity.price}', style: styles.smallLabel),
                          Text('${opportunity.fundedPct}%', style: styles.smallLabel.copyWith(color: C['blue'], fontWeight: FontWeight.bold)),
                        ],
                      ),
                      r.verticalSpace(4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(r.radius(10)),
                        child: LinearProgressIndicator(
                          value: opportunity.fundedPct / 100.0,
                          minHeight: r.hp(1.2),
                          backgroundColor: C['bluePale'],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            opportunity.fundedPct == 100 ? C['green']! : C['navy']!,
                          ),
                        ),
                      ),
                    ],
                  ),
                  r.verticalSpace(12),
                  // --- Key Financials ---
                  Row(
                    children: [
                      _FinancialInfoBox(label: 'Expected Annual Return', value: opportunity.annualReturn),
                      r.horizontalSpace(8),
                      _FinancialInfoBox(label: 'Rental Yield', value: opportunity.rentalYield),
                      r.horizontalSpace(8),
                      _FinancialInfoBox(label: 'Distribution', value: opportunity.distribution),
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
}

class _FinancialInfoBox extends StatelessWidget {
  final String label;
  final String value;

  const _FinancialInfoBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: r.hp(1)),
        decoration: BoxDecoration(
          color: OpportunityCardScreen.C['bluePale'],
          borderRadius: BorderRadius.circular(r.radius(8)),
        ),
        child: Column(
          children: [
            Text(value, style: styles.financialKey, textAlign: TextAlign.center),
            r.verticalSpace(2),
            Text(label, style: styles.financialLabel, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
