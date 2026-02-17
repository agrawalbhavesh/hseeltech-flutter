import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Assuming AppTextStyles and AppSpacing are defined elsewhere
// For example, in lib/utils/text_styles.dart and lib/utils/spacing.dart

class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
  TextStyle get body => TextStyle(fontSize: r.sp(14), color: const Color(0xFF6B7280));
  // Add other styles as needed
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);

  EdgeInsets get pageHorizontal => EdgeInsets.symmetric(horizontal: r.wp(5));
  // Add other spacing constants as needed
}

class InvestSuccessEnglishScreen extends StatefulWidget {
  const InvestSuccessEnglishScreen({Key? key}) : super(key: key);

  @override
  _InvestSuccessEnglishScreenState createState() => _InvestSuccessEnglishScreenState();
}

class _InvestSuccessEnglishScreenState extends State<InvestSuccessEnglishScreen> with TickerProviderStateMixin {
  bool _showDetails = false;
  bool _copied = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final txData = {
    "propertyName": "Al Yasmin Tower – Riyadh",
    "propertyType": "Residential",
    "investmentAmount": "5,000",
    "tokens": "10",  // v3.0: renamed from shares
    "pricePerToken": "500",  // v3.0: renamed from pricePerShare
    "expectedReturn": "9.2%",
    "investmentDate": "February 12, 2026",
    "transactionId": "HSL-2026-00847",
    "paymentMethod": "Hseeltech Wallet",
    "status": "Completed",
    "nextDistribution": "March 2026",
    "totalPortfolioValue": "47,500",
   };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    Timer(const Duration(milliseconds: 200), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleCopy() {
    Clipboard.setData(ClipboardData(text: txData['transactionId']!));
    setState(() {
      _copied = true;
    });
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _copied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    const C = {
      'navy': Color(0xFF1B2A4A),
      'green': Color(0xFF2D6A4F),
      'greenLight': Color(0xFF40916C),
      'greenPale': Color(0xFFECFDF5),
      'blue': Color(0xFF2E5090),
      'bluePale': Color(0xFFEDF2F9),
      'blueGhost': Color(0xFFF5F8FC),
      'dark': Color(0xFF1B1B1B),
      'gray': Color(0xFF6B7280),
      'grayLight': Color(0xFF9CA3AF),
      'white': Color(0xFFFFFFFF),
      'border': Color(0xFFE2E8F0),
      'gold': Color(0xFFD4A017),
      'goldPale': Color(0xFFFEF9E7),
     };

    return Scaffold(
      backgroundColor: C['white'],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSuccessHero(r, styles, C),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(2)),
                child: Column(
                  children: [
                    _buildAmountCard(r, styles, C),
                    r.verticalSpace(16),
                    _buildPropertyInfo(r, styles, C),
                    r.verticalSpace(16),
                    _buildTransactionDetails(r, styles, C),
                    r.verticalSpace(16),
                    _buildPortfolioUpdate(r, styles, C),
                    r.verticalSpace(16),
                    _buildActionButtons(r, styles, C),
                    r.verticalSpace(16),
                    _buildNavigationButtons(r, styles, C),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessHero(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Container(
      padding: EdgeInsets.only(top: r.hp(8), bottom: r.hp(4), left: r.wp(6), right: r.wp(6)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [C['green']!, C['greenLight']!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          ScaleTransition(
            scale: _animation,
            child: Container(
              width: r.icon(80),
              height: r.icon(80),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
              ),
              child: Center(
                child: Icon(Icons.check, color: C['white'], size: r.icon(40)),
              ),
            ),
          ),
          r.verticalSpace(20),
          Text(
            'Investment Successful! 🎉',
            textAlign: TextAlign.center,
            style: styles.heading1.copyWith(color: C['white'], fontSize: r.sp(24)),
          ),
          r.verticalSpace(8),
          Text(
            'Congratulations! Your investment has been confirmed',
            textAlign: TextAlign.center,
            style: styles.body.copyWith(color: Colors.white.withOpacity(0.85), fontSize: r.sp(14)),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountCard(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Container(
      padding: EdgeInsets.all(r.wp(5)),
      decoration: BoxDecoration(
        color: C['greenPale'],
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: C['green']!.withOpacity(0.12)),
      ),
      child: Column(
        children: [
          Text('Investment Amount', style: styles.body.copyWith(color: C['green'], fontWeight: FontWeight.w500, fontSize: r.sp(13))),
          r.verticalSpace(4),
          RichText(
            text: TextSpan(
              style: styles.heading1.copyWith(color: C['green'], fontSize: r.sp(32)),
              children: [
                TextSpan(text: 'SAR ', style: TextStyle(fontSize: r.sp(16))),
                TextSpan(text: txData['investmentAmount']!),
              ],
            ),
          ),
          r.verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.5)),
                decoration: BoxDecoration(
                  color: C['green']!.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(r.radius(20)),
                ),
                child: Text('${txData['tokens']} Shares', style: TextStyle(fontSize: r.sp(12), color: C['green'], fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: r.wp(2)),
                child: Text('×', style: TextStyle(fontSize: r.sp(12), color: C['gray'])),
              ),
              Text('SAR ${txData['pricePerToken']} / token', style: TextStyle(fontSize: r.sp(12), color: C['gray']))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPropertyInfo(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: C['blueGhost'],
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: C['border']!),
      ),
      child: Row(
        children: [
          Container(
            width: r.icon(48),
            height: r.icon(48),
            decoration: BoxDecoration(
              color: C['bluePale'],
              borderRadius: BorderRadius.circular(r.radius(12)),
            ),
            child: Icon(Icons.business_outlined, size: r.icon(24), color: C['blue']),
          ),
          r.horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txData['propertyName']!, style: styles.body.copyWith(color: C['dark'], fontWeight: FontWeight.bold, fontSize: r.sp(15))),
                r.verticalSpace(4),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.5)),
                      decoration: BoxDecoration(
                        color: C['bluePale'],
                        borderRadius: BorderRadius.circular(r.radius(20)),
                      ),
                      child: Text(txData['propertyType']!, style: TextStyle(fontSize: r.sp(11), color: C['blue']))
                    ),
                    r.horizontalSpace(8),
                    Text('Expected Return: ${txData['expectedReturn']}', style: TextStyle(fontSize: r.sp(12), color: C['gray']))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTransactionDetails(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: C['border']!),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _showDetails = !_showDetails),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.8)),
              decoration: BoxDecoration(
                color: C['blueGhost'],
                borderRadius: BorderRadius.vertical(top: Radius.circular(r.radius(16))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Transaction Details', style: styles.body.copyWith(color: C['dark'], fontWeight: FontWeight.bold, fontSize: r.sp(14))),
                  Icon(_showDetails ? Icons.expand_less : Icons.expand_more, size: r.icon(20), color: C['gray']),
                ],
              ),
            ),
          ),
          if (_showDetails)
            Padding(
              padding: EdgeInsets.all(r.wp(4)),
              child: Column(
                children: [
                  _buildDetailRow(r, C, Icons.tag, 'Transaction ID', txData['transactionId']!),
                  _buildDetailRow(r, C, Icons.calendar_today_outlined, 'Investment Date', txData['investmentDate']!),
                  _buildDetailRow(r, C, Icons.credit_card_outlined, 'Payment Method', txData['paymentMethod']!),
                  _buildDetailRow(r, C, Icons.check_circle_outline, 'Status', txData['status']!, isStatus: true),
                  _buildDetailRow(r, C, Icons.access_time_outlined, 'Next Distribution', txData['nextDistribution']!),
                  r.verticalSpace(8),
                  OutlinedButton.icon(
                    onPressed: _handleCopy,
                    icon: Icon(_copied ? Icons.check : Icons.copy, size: r.icon(16), color: _copied ? C['green'] : C['blue']),
                    label: Text(_copied ? 'Copied!' : 'Copy Transaction ID', style: TextStyle(fontSize: r.sp(12), color: _copied ? C['green'] : C['blue'], fontWeight: FontWeight.w500)),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, r.hp(5)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(8))),
                      side: BorderSide(color: C['border']!),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(Responsive r, Map<String, Color> C, IconData icon, String label, String value, {bool isStatus = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: r.hp(0.8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: r.icon(16), color: C['grayLight']),
              r.horizontalSpace(8),
              Text(label, style: TextStyle(fontSize: r.sp(13), color: C['gray']))
            ],
          ),
          if (isStatus)
            Container(
              padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.5)),
              decoration: BoxDecoration(
                color: C['greenPale'],
                borderRadius: BorderRadius.circular(r.radius(20)),
              ),
              child: Text(value, style: TextStyle(fontSize: r.sp(13), color: C['green'], fontWeight: FontWeight.bold)),
            )
          else
            Text(value, style: TextStyle(fontSize: r.sp(13), color: C['dark'], fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildPortfolioUpdate(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Container(
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: C['goldPale'],
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: C['gold']!.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Updated Portfolio Value', style: styles.body.copyWith(color: C['dark'], fontSize: r.sp(13))),
              r.verticalSpace(4),
              Text('SAR ${txData['totalPortfolioValue']}', style: styles.heading1.copyWith(fontSize: r.sp(20))),
            ],
          ),
          Container(
            width: r.icon(40),
            height: r.icon(40),
            decoration: BoxDecoration(
              color: C['gold']!.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.work_outline, size: r.icon(20), color: C['gold']),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.share_outlined, size: r.icon(16), color: C['blue']),
            label: Text('Share', style: TextStyle(fontSize: r.sp(13), color: C['blue'], fontWeight: FontWeight.w600)),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: r.hp(1.8)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
              side: BorderSide(color: C['border']!),
            ),
          ),
        ),
        r.horizontalSpace(12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.download_outlined, size: r.icon(16), color: C['blue']),
            label: Text('Download Receipt', style: TextStyle(fontSize: r.sp(13), color: C['blue'], fontWeight: FontWeight.w600)),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: r.hp(1.8)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
              side: BorderSide(color: C['border']!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(Responsive r, AppTextStyles styles, Map<String, Color> C) {
    return Column(
      children: [
        r.verticalSpace(8),
        ElevatedButton(
          onPressed: () {},
          child: const Text('View My Portfolio'),
          style: ElevatedButton.styleFrom(
            backgroundColor: C['navy'],
            foregroundColor: C['white'],
            minimumSize: Size(double.infinity, r.hp(6.5)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
            textStyle: TextStyle(fontSize: r.sp(15), fontWeight: FontWeight.bold),
          ),
        ),
        r.verticalSpace(12),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Explore More Opportunities'),
          style: OutlinedButton.styleFrom(
            foregroundColor: C['navy'],
            minimumSize: Size(double.infinity, r.hp(6.5)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.radius(12))),
            side: BorderSide(color: C['navy']!),
            textStyle: TextStyle(fontSize: r.sp(15), fontWeight: FontWeight.w600),
          ),
        ),
        r.verticalSpace(8),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.home_outlined, size: r.icon(20), color: C['gray']),
          label: Text('Back to Home', style: TextStyle(fontSize: r.sp(13), color: C['gray']))
        ),
      ],
    );
  }
}
