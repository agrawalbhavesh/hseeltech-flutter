import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum InvestFlowStep { select, review, payment, topup, terms, sign, processing, success }

class InvestFlowScreen extends StatefulWidget {
  const InvestFlowScreen({Key? key}) : super(key: key);

  @override
  _InvestFlowScreenState createState() => _InvestFlowScreenState();
}

class _InvestFlowScreenState extends State<InvestFlowScreen> {
  InvestFlowStep _currentStep = InvestFlowStep.select;
  int _tokens = 1;
  final double _walletBalance = 50000;
  final double _tokenPrice = 10000;
  final int _availableTokens = 15;

  void _nextStep() {
    setState(() {
      switch (_currentStep) {
        case InvestFlowStep.select:
          _currentStep = InvestFlowStep.review;
          break;
        case InvestFlowStep.review:
          if (_walletBalance >= _tokens * _tokenPrice) {
            _currentStep = InvestFlowStep.payment;
          } else {
            _currentStep = InvestFlowStep.topup;
          }
          break;
        case InvestFlowStep.payment:
          _currentStep = InvestFlowStep.terms;
          break;
        case InvestFlowStep.topup:
          // This would be handled after a successful top-up action
          _currentStep = InvestFlowStep.payment;
          break;
        case InvestFlowStep.terms:
          _currentStep = InvestFlowStep.sign;
          break;
        case InvestFlowStep.sign:
          _currentStep = InvestFlowStep.processing;
          // Simulate processing time
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              _currentStep = InvestFlowStep.success;
            });
          });
          break;
        default:
          break;
      }
    });
  }

  void _previousStep() {
    setState(() {
       switch (_currentStep) {
        case InvestFlowStep.review:
          _currentStep = InvestFlowStep.select;
          break;
        case InvestFlowStep.payment:
          _currentStep = InvestFlowStep.review;
          break;
        case InvestFlowStep.topup:
          _currentStep = InvestFlowStep.review;
          break;
        case InvestFlowStep.terms:
          _currentStep = InvestFlowStep.payment;
          break;
        case InvestFlowStep.sign:
          _currentStep = InvestFlowStep.terms;
          break;
        default:
          Navigator.of(context).pop();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _buildStep(),
        ),
      ),
    );
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case InvestFlowStep.select:
        return SelectTokensStep(
          key: const ValueKey('select'),
          tokens: _tokens,
          setTokens: (s) => setState(() => _tokens = s),
          onContinue: _nextStep,
          onBack: _previousStep,
          tokenPrice: _tokenPrice,
          availableTokens: _availableTokens,
        );
      // ... other steps would be implemented here
      default:
        return SelectTokensStep(
          key: const ValueKey('default'),
          tokens: _tokens,
          setTokens: (s) => setState(() => _tokens = s),
          onContinue: _nextStep,
          onBack: _previousStep,
          tokenPrice: _tokenPrice,
          availableTokens: _availableTokens,
        );
    }
  }
}

class SelectTokensStep extends StatelessWidget {
  final int tokens;  // v3.0: renamed from shares
  final Function(int) setTokens;
  final VoidCallback onContinue;
  final VoidCallback onBack;
  final double tokenPrice;
  final int availableTokens;

  const SelectTokensStep({
    Key? key,
    required this.tokens,
    required this.setTokens,
    required this.onContinue,
    required this.onBack,
    required this.tokenPrice,
    required this.availableTokens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);
    final total = tokens * tokenPrice;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(r, styles, onBack, 'Invest'),
          spacing.verticalSpace(12),
          _buildProgress(r, styles, 1),
          spacing.verticalSpace(20),
          _buildPropertyCard(r, styles, spacing),
          spacing.verticalSpace(20),
          _buildShareSelector(r, styles, spacing, total),
          spacing.verticalSpace(20),
          _buildContinueButton(r, styles, onContinue, 'Continue'),
          spacing.verticalSpace(24),
        ],
      ),
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles, VoidCallback onBack, String title) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              width: r.icon(36),
              height: r.icon(36),
              decoration: const BoxDecoration(
                color: Color(0xFFEDF2F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chevron_left,
                size: r.icon(20),
                color: const Color(0xFF1B2A4A),
              ),
            ),
          ),
          SizedBox(width: r.wp(3)),
          Text(title, style: styles.heading2.copyWith(color: const Color(0xFF1B1B1B))),
        ],
      ),
    );
  }

  Widget _buildProgress(Responsive r, AppTextStyles styles, int step) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: r.hp(0.5),
                  margin: EdgeInsets.symmetric(horizontal: r.wp(0.5)),
                  decoration: BoxDecoration(
                    color: index < step ? const Color(0xFF1B2A4A) : const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(r.radius(4)),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: r.hp(1)),
          Text(
            'Step $step of 5',
            style: styles.bodySmall.copyWith(color: const Color(0xFF9CA3AF)),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: r.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Container(
            height: r.hp(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(r.radius(16))),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600&h=300&fit=crop'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(r.radius(16))),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(r.wp(3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Al-Olaya Heights', style: styles.heading3.copyWith(color: Colors.white)),
                    SizedBox(height: r.hp(0.5)),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white.withOpacity(0.7), size: r.icon(12)),
                        SizedBox(width: r.wp(1)),
                        Text('Riyadh, Al-Olaya District', style: styles.bodyXSmall.copyWith(color: Colors.white.withOpacity(0.7))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(r.wp(3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPropertyStat(r, styles, 'Token Price', '${tokenPrice.toInt()} SAR'),
                _buildVerticalDivider(r),
                _buildPropertyStat(r, styles, 'Available', '$availableTokens tokens'),
                _buildVerticalDivider(r),
                _buildPropertyStat(r, styles, 'Return', '12.5%', valueColor: const Color(0xFF2D6A4F)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyStat(Responsive r, AppTextStyles styles, String label, String value, {Color? valueColor}) {
    return Column(
      children: [
        Text(label.toUpperCase(), style: styles.overline.copyWith(color: const Color(0xFF9CA3AF))),
        SizedBox(height: r.hp(0.5)),
        Text(value, style: styles.body.copyWith(fontWeight: FontWeight.bold, color: valueColor ?? const Color(0xFF1B2A4A))),
      ],
    );
  }

  Widget _buildVerticalDivider(Responsive r) {
    return Container(
      width: 1,
      height: r.hp(4),
      color: const Color(0xFFE2E8F0),
    );
  }

  Widget _buildShareSelector(Responsive r, AppTextStyles styles, AppSpacing spacing, double total) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: r.wp(4)),
      padding: EdgeInsets.all(r.wp(5)),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Number of Shares'.toUpperCase(),
            style: styles.overline.copyWith(color: const Color(0xFF9CA3AF)),
          ),
          spacing.verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildQuantityButton(r, Icons.remove, () {
                if (tokens > 1) setTokens(tokens - 1);
              }, enabled: tokens > 1),
              SizedBox(width: r.wp(6)),
              Column(
                children: [
                  Text('$tokens', style: styles.display1.copyWith(color: const Color(0xFF1B2A4A))),
                  Text(tokens == 1 ? 'token' : 'tokens', style: styles.bodySmall.copyWith(color: const Color(0xFF9CA3AF))),
                ],
              ),
              SizedBox(width: r.wp(6)),
              _buildQuantityButton(r, Icons.add, () {
                if (tokens < availableTokens) setTokens(tokens + 1);
              }, enabled: true, primary: true),
            ],
          ),
          spacing.verticalSpace(20),
          const Divider(color: Color(0xFFE2E8F0)),
          spacing.verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Investment', style: styles.body.copyWith(color: const Color(0xFF6B7280))),
              Text('${total.toInt()} SAR', style: styles.heading2.copyWith(color: const Color(0xFF1B2A4A))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(Responsive r, IconData icon, VoidCallback onPressed, {bool enabled = true, bool primary = false}) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: r.icon(48),
        height: r.icon(48),
        decoration: BoxDecoration(
          color: primary ? const Color(0xFF1B2A4A) : (enabled ? const Color(0xFFEDF2F9) : Colors.white),
          borderRadius: BorderRadius.circular(r.radius(16)),
          border: Border.all(color: enabled ? const Color(0xFF1B2A4A) : const Color(0xFFE2E8F0)),
        ),
        child: Icon(
          icon,
          size: r.icon(20),
          color: primary ? Colors.white : (enabled ? const Color(0xFF1B2A4A) : const Color(0xFF9CA3AF)),
        ),
      ),
    );
  }

  Widget _buildContinueButton(Responsive r, AppTextStyles styles, VoidCallback onPressed, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B2A4A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(r.radius(16)),
          ),
          padding: EdgeInsets.symmetric(vertical: r.hp(2)),
          minimumSize: const Size(double.infinity, 0),
          elevation: 8,
          shadowColor: const Color(0xFF1B2A4A).withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: styles.button.copyWith(color: Colors.white)),
            SizedBox(width: r.wp(2)),
            Icon(Icons.arrow_forward, size: r.icon(16), color: Colors.white),
          ],
        ),
      ),
    );
  }
}
