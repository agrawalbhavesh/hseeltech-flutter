import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  int _currentImageIndex = 0;
  late Timer _timer;
  String _activeTab = "Overview";

  final List<String> _heroImages = [
    "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800&h=500&fit=crop",
    "https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800&h=500&fit=crop",
    "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800&h=500&fit=crop",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _heroImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageCarousel(r, styles),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTags(r, styles),
                        r.verticalSpace(16),
                        _buildFundingProgress(r, styles, 9250000, 12500000),
                        r.verticalSpace(16),
                        _buildMetricCards(r, styles),
                        r.verticalSpace(24),
                        _buildTabs(r, styles),
                        r.verticalSpace(16),
                        _buildTabContent(r, styles),
                        r.verticalSpace(100), // Space for the sticky footer
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildStickyFooter(r, styles),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(Responsive r, AppTextStyles styles) {
    return SizedBox(
      height: r.hp(28),
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.network(
              _heroImages[_currentImageIndex],
              key: ValueKey<int>(_currentImageIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Positioned(
            top: r.hp(6),
            left: r.wp(4),
            child: _buildIconButton(r, Icons.chevron_left, () => Navigator.pop(context)),
          ),
          Positioned(
            top: r.hp(6),
            right: r.wp(4),
            child: Row(
              children: [
                _buildIconButton(r, Icons.favorite_border, () {}),
                r.horizontalSpace(8),
                _buildIconButton(r, Icons.share, () {}),
              ],
            ),
          ),
          Positioned(
            bottom: r.hp(2),
            left: r.wp(4),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.75)),
              decoration: BoxDecoration(
                color: const Color(0xFF2D6A4F),
                borderRadius: BorderRadius.circular(r.radius(20)),
              ),
              child: Text(
                'Available',
                style: styles.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: r.hp(2.5),
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_heroImages.length, (index) {
                return GestureDetector(
                  onTap: () => setState(() => _currentImageIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: r.wp(1)),
                    width: r.wp(index == _currentImageIndex ? 2.5 : 2),
                    height: r.wp(index == _currentImageIndex ? 2.5 : 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == _currentImageIndex ? Colors.white : Colors.white.withOpacity(0.4),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: r.hp(2),
            right: r.wp(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Al-Olaya Towers', style: styles.heading3.copyWith(color: Colors.white)),
                Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.white.withOpacity(0.8), size: r.icon(14)),
                    r.horizontalSpace(4),
                    Text('Al-Olaya, Riyadh', style: styles.caption.copyWith(color: Colors.white.withOpacity(0.8))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(Responsive r, IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(r.radius(50)),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(r.radius(50)),
        child: Container(
          width: r.icon(36),
          height: r.icon(36),
          child: Icon(icon, color: Colors.white, size: r.icon(20)),
        ),
      ),
    );
  }

  Widget _buildTags(Responsive r, AppTextStyles styles) {
    final tags = [
      {"icon": Icons.business, "text": "Residential"},
      {"icon": Icons.king_bed, "text": "2 Bed"},
      {"icon": Icons.bathtub, "text": "2 Bath"},
      {"icon": Icons.fullscreen, "text": "150 sqm"},
    ];

    return Wrap(
      spacing: r.wp(2),
      runSpacing: r.hp(1),
      children: tags.map((tag) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(1)),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F8FC),
            borderRadius: BorderRadius.circular(r.radius(8)),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(tag["icon"] as IconData, size: r.icon(14), color: const Color(0xFF1B2A4A)),
              r.horizontalSpace(6),
              Text(tag["text"] as String, style: styles.caption.copyWith(color: const Color(0xFF1B2A4A), fontWeight: FontWeight.w600)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFundingProgress(Responsive r, AppTextStyles styles, double raised, double goal) {
    final pct = (raised / goal).clamp(0.0, 1.0);
    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F9),
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: const Color(0xFFD0DBE8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Funding Progress', style: styles.caption.copyWith(color: const Color(0xFF1B2A4A), fontWeight: FontWeight.bold)),
              Text('${(pct * 100).toStringAsFixed(0)}%', style: styles.body.copyWith(color: const Color(0xFF1B2A4A), fontWeight: FontWeight.bold)),
            ],
          ),
          r.verticalSpace(8),
          ClipRRect(
            borderRadius: BorderRadius.circular(r.radius(10)),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: r.hp(1.2),
              backgroundColor: const Color(0xFF1B2A4A).withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1B2A4A)),
            ),
          ),
          r.verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${(raised / 1e6).toStringAsFixed(1)}M SAR raised', style: styles.caption.copyWith(color: const Color(0xFF6B7280))),
              Text('of ${(goal / 1e6).toStringAsFixed(1)}M SAR', style: styles.caption.copyWith(color: const Color(0xFF9CA3AF))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCards(Responsive r, AppTextStyles styles) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: r.wp(3),
      mainAxisSpacing: r.hp(1.5),
      childAspectRatio: 1.8,
      children: [
        _MetricCard(icon: Icons.trending_up, label: "Expected Annual Return", value: "8.37", suffix: "%"),
        _MetricCard(icon: Icons.business, label: "Price / Share", value: "10,000", suffix: "SAR"),
        _MetricCard(icon: Icons.bar_chart, label: "Net Rental Yield", value: "7.2", suffix: "%"),
        _MetricCard(icon: Icons.calendar_today, label: "Distribution", value: "Quarterly"),
      ],
    );
  }

  Widget _buildTabs(Responsive r, AppTextStyles styles) {
    final tabs = ["Overview", "Financials", "Location", "Documents"];
    return Container(
      padding: EdgeInsets.all(r.wp(1)),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F9),
        borderRadius: BorderRadius.circular(r.radius(16)),
      ),
      child: Row(
        children: tabs.map((tab) {
          final isActive = _activeTab == tab;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _activeTab = tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: r.hp(1.5)),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(r.radius(12)),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                child: Text(
                  tab,
                  textAlign: TextAlign.center,
                  style: styles.caption.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isActive ? const Color(0xFF1B2A4A) : const Color(0xFF6B7280),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTabContent(Responsive r, AppTextStyles styles) {
    switch (_activeTab) {
      case "Financials":
        return _InvestmentCalculator(key: const ValueKey("Financials"));
      case "Location":
        return _LocationTab(key: const ValueKey("Location"));
      case "Documents":
        return _DocumentsTab(key: const ValueKey("Documents"));
      case "Overview":
      default:
        return _OverviewTab(key: const ValueKey("Overview"));
    }
  }

  Widget _buildStickyFooter(Responsive r, AppTextStyles styles) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(r.wp(5), r.hp(2), r.wp(5), r.hp(3)),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.92),
          border: const Border(top: BorderSide(color: Color(0xFFE2E8F0))),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Min. Investment',
                    style: styles.caption.copyWith(color: const Color(0xFF9CA3AF), letterSpacing: 1.1),
                  ),
                  RichText(
                    text: TextSpan(
                      style: styles.heading3.copyWith(color: const Color(0xFF1B1B1B)),
                      children: [
                        const TextSpan(text: '10,000 '),
                        TextSpan(
                          text: 'SAR',
                          style: styles.body.copyWith(color: const Color(0xFF9CA3AF)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            r.horizontalSpace(12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D6A4F),
                  padding: EdgeInsets.symmetric(vertical: r.hp(2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r.radius(16)),
                  ),
                  elevation: 8,
                  shadowColor: const Color(0xFF2D6A4F).withOpacity(0.3),
                ),
                child: Text('Invest Now', style: styles.body.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String? suffix;

  const _MetricCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Container(
      padding: EdgeInsets.all(r.wp(3.5)),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(r.radius(12)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: r.icon(20), color: const Color(0xFF2E5090)),
              r.horizontalSpace(8),
              Expanded(
                child: Text(
                  label,
                  style: styles.caption.copyWith(color: const Color(0xFF9CA3AF)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          r.verticalSpace(8),
          RichText(
            text: TextSpan(
              style: styles.heading3.copyWith(color: const Color(0xFF1B1B1B)),
              children: [
                TextSpan(text: value),
                if (suffix != null)
                  TextSpan(
                    text: ' ${suffix!}',
                    style: styles.caption.copyWith(color: const Color(0xFF9CA3AF)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(r, styles, Icons.info_outline, "About the Opportunity"),
        r.verticalSpace(8),
        Text(
          "Located in the heart of Riyadh's bustling business district, Al-Olaya Towers represents a prime investment in commercial real-estate. This iconic twin-tower complex offers premium office spaces with state-of-the-art facilities, attracting a portfolio of high-profile corporate tenants. The strategic location ensures high occupancy rates and consistent rental income, making it a stable and lucrative asset.",
          style: styles.body.copyWith(color: const Color(0xFF6B7280), height: 1.6),
        ),
        r.verticalSpace(24),
        _buildSectionHeader(r, styles, Icons.shield_outlined, "Key Highlights"),
        r.verticalSpace(12),
        _buildHighlightItem(r, styles, Icons.check_circle, "High-demand location with 95% occupancy rate."),
        _buildHighlightItem(r, styles, Icons.check_circle, "Long-term leases with multinational corporations."),
        _buildHighlightItem(r, styles, Icons.check_circle, "Projected 8.37% annual return from rental income."),
        _buildHighlightItem(r, styles, Icons.check_circle, "Managed by a top-tier property management firm."),
      ],
    );
  }

  Widget _buildSectionHeader(Responsive r, AppTextStyles styles, IconData icon, String title) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(r.wp(1.5)),
          decoration: BoxDecoration(
            color: const Color(0xFF1B2A4A).withOpacity(0.1),
            borderRadius: BorderRadius.circular(r.radius(8)),
          ),
          child: Icon(icon, size: r.icon(16), color: const Color(0xFF1B2A4A)),
        ),
        r.horizontalSpace(8),
        Text(title, style: styles.body.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF1B1B1B))),
      ],
    );
  }

  Widget _buildHighlightItem(Responsive r, AppTextStyles styles, IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: r.hp(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: r.icon(16), color: const Color(0xFF2D6A4F)),
          r.horizontalSpace(8),
          Expanded(child: Text(text, style: styles.body.copyWith(color: const Color(0xFF6B7280)))),
        ],
      ),
    );
  }
}

class _FinancialsTab extends StatelessWidget {
  const _FinancialsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Column(
      children: [
        _buildFinancialMetric(r, styles, "Projected Annualized Return", "12.5%", const Color(0xFF2D6A4F)),
        _buildFinancialMetric(r, styles, "Expected Rental Yield (Net)", "7.2%", const Color(0xFF1B2A4A)),
        _buildFinancialMetric(r, styles, "Targeted IRR", "15.0%", const Color(0xFF1B2A4A)),
        _buildFinancialMetric(r, styles, "Minimum Investment", "10,000 SAR", const Color(0xFF6B7280)),
        _buildFinancialMetric(r, styles, "Funding Goal", "12.5M SAR", const Color(0xFF6B7280)),
      ],
    );
  }

  Widget _buildFinancialMetric(Responsive r, AppTextStyles styles, String label, String value, Color valueColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: r.hp(1.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: styles.body.copyWith(color: const Color(0xFF6B7280))),
          Text(value, style: styles.body.copyWith(color: valueColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _LocationTab extends StatelessWidget {
  const _LocationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(r.radius(12)),
          child: Image.network(
            "https://images.unsplash.com/photo-1524661135-423995f22d0b?w=800&h=400&fit=crop",
            height: r.hp(20),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        r.verticalSpace(16),
        Text("Al-Olaya, Riyadh, Saudi Arabia", style: styles.body.copyWith(fontWeight: FontWeight.bold)),
        r.verticalSpace(8),
        Text(
          "Situated on the iconic Olaya Street, the property is at the epicenter of Riyadh's financial hub, surrounded by major banks, corporate headquarters, and luxury hotels. Excellent connectivity via King Fahd Road and the Riyadh Metro ensures easy access.",
          style: styles.body.copyWith(color: const Color(0xFF6B7280), height: 1.6),
        ),
      ],
    );
  }
}

class _DocumentsTab extends StatelessWidget {
  const _DocumentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    return Column(
      children: [
        _buildDocumentItem(r, styles, "Prospectus.pdf", "1.2 MB"),
        _buildDocumentItem(r, styles, "Financial Statement Q4 2025.pdf", "800 KB"),
        _buildDocumentItem(r, styles, "Property Valuation Report.pdf", "2.5 MB"),
        _buildDocumentItem(r, styles, "Lease Agreement Summary.pdf", "450 KB"),
      ],
    );
  }

  Widget _buildDocumentItem(Responsive r, AppTextStyles styles, String title, String size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: r.hp(1)),
      child: Row(
        children: [
          Icon(Icons.description, color: const Color(0xFF1B2A4A), size: r.icon(24)),
          r.horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: styles.body.copyWith(fontWeight: FontWeight.w600)),
                Text(size, style: styles.caption.copyWith(color: const Color(0xFF9CA3AF))),
              ],
            ),
          ),
          Icon(Icons.download_for_offline_outlined, color: const Color(0xFF2E5090), size: r.icon(24)),
        ],
      ),
    );
  }
}

class _InvestmentCalculator extends StatefulWidget {
  const _InvestmentCalculator({Key? key}) : super(key: key);

  @override
  __InvestmentCalculatorState createState() => __InvestmentCalculatorState();
}

class __InvestmentCalculatorState extends State<_InvestmentCalculator> {
  double _tokens = 1;
  double _holdYears = 5;

  final double _tokenPrice = 10000;
  final double _annualReturn = 8.37;
  final double _appreciation = 3.5;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);

    final investment = _tokens * _tokenPrice;
    final totalRentalIncome = investment * (_annualReturn / 100) * _holdYears;
    final capitalAppreciation = investment * pow(1 + _appreciation / 100, _holdYears) - investment;
    final totalReturn = totalRentalIncome + capitalAppreciation;

    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(r.radius(16)),
      ),
      child: Column(
        children: [
          _buildSlider(r, styles, "Number of Shares", _tokens, 1, 50, 0, (val) => setState(() => _tokens = val)),
          r.verticalSpace(16),
          _buildSlider(r, styles, "Holding Period (Years)", _holdYears, 1, 10, 0, (val) => setState(() => _holdYears = val)),
          r.verticalSpace(24),
          _buildCalculationResult(r, styles, "Your Investment", investment, "SAR"),
          r.verticalSpace(16),
          _buildCalculationResult(r, styles, "Total Rental Income", totalRentalIncome, "SAR"),
          r.verticalSpace(16),
          _buildCalculationResult(r, styles, "Capital Appreciation", capitalAppreciation, "SAR"),
          r.verticalSpace(16),
          _buildCalculationResult(r, styles, "Total Estimated Return", totalReturn, "SAR", isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSlider(Responsive r, AppTextStyles styles, String label, double value, double min, double max, int divisions, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: styles.body.copyWith(color: const Color(0xFF6B7280))),
            Text(value.toStringAsFixed(0), style: styles.body.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        r.verticalSpace(8),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).toInt(),
          label: value.toStringAsFixed(0),
          onChanged: onChanged,
          activeColor: const Color(0xFF1B2A4A),
          inactiveColor: const Color(0xFFE2E8F0),
        ),
      ],
    );
  }

  Widget _buildCalculationResult(Responsive r, AppTextStyles styles, String label, double value, String currency, {bool isTotal = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
      decoration: BoxDecoration(
        color: isTotal ? const Color(0xFF1B2A4A) : const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(r.radius(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: styles.body.copyWith(color: isTotal ? Colors.white70 : const Color(0xFF6B7280))),
          Text('${value.toStringAsFixed(0)} $currency', style: styles.body.copyWith(fontWeight: FontWeight.bold, color: isTotal ? Colors.white : const Color(0xFF1B1B1B))),
        ],
      ),
    );
  }
}
