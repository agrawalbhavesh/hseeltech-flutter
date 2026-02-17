import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});
  @override State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  double _amount = 0;
  String _selectedMethod = 'mada';
  final _amountController = TextEditingController();
  final _quickAmounts = [1000, 5000, 10000, 25000];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = ScreenUtil();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        title: Text('Deposit', style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w700, fontSize: r.sp(16), color: const Color(0xFF1B2A4A))),
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Color(0xFF1B2A4A)),
          onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(r.w(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // Balance Card
          Container(
            padding: EdgeInsets.all(r.w(20)),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1B2A4A), Color(0xFF2E5090)]),
              borderRadius: BorderRadius.circular(r.r(16))),
            child: Column(children: [
              Text('Available Balance', style: TextStyle(fontFamily: 'MontserratArabic',
                color: Colors.white70, fontSize: r.sp(12))),
              SizedBox(height: r.h(4)),
              Text('SAR 24,500.00', style: TextStyle(fontFamily: 'MontserratArabic',
                fontWeight: FontWeight.w800, fontSize: r.sp(24), color: Colors.white)),
            ]),
          ),
          SizedBox(height: r.h(20)),
          // Amount Input
          Container(
            padding: EdgeInsets.all(r.w(20)),
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(r.r(16)),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
            child: Column(children: [
              Text('Enter Amount', style: TextStyle(fontFamily: 'MontserratArabic',
                fontWeight: FontWeight.w600, fontSize: r.sp(13), color: const Color(0xFF64748B))),
              SizedBox(height: r.h(12)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('SAR ', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w700, fontSize: r.sp(16), color: const Color(0xFF1B2A4A))),
                Text(_amount > 0 ? _amount.toStringAsFixed(0) : '0',
                  style: TextStyle(fontFamily: 'MontserratArabic',
                    fontWeight: FontWeight.w800, fontSize: r.sp(36), color: const Color(0xFF1B2A4A))),
              ]),
              SizedBox(height: r.h(16)),
              // Quick Amount Chips
              Wrap(spacing: r.w(8), children: _quickAmounts.map((amt) =>
                ChoiceChip(
                  label: Text('${amt >= 1000 ? "${amt ~/ 1000}K" : amt.toString()}',
                    style: TextStyle(fontFamily: 'MontserratArabic', fontSize: r.sp(12))),
                  selected: _amount == amt,
                  onSelected: (s) => setState(() => _amount = amt.toDouble()),
                )).toList()),
            ]),
          ),
          SizedBox(height: r.h(20)),
          // Payment Methods
          ...['mada', 'viban', 'apple_pay'].map((method) => _buildMethodCard(method, r)),
          SizedBox(height: r.h(20)),
          // Deposit Button
          ElevatedButton(
            onPressed: _amount > 0 ? () {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B2A4A),
              padding: EdgeInsets.symmetric(vertical: r.h(16)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.r(12)))),
            child: Text('Deposit SAR ${_amount.toStringAsFixed(0)}',
              style: TextStyle(fontFamily: 'MontserratArabic',
                fontWeight: FontWeight.w700, fontSize: r.sp(14), color: Colors.white)),
          ),
        ]),
      ),
    );
  }

  Widget _buildMethodCard(String method, ScreenUtil r) {
    final titles = {'mada': 'mada Card', 'viban': 'Bank Transfer (VIBAN)', 'apple_pay': 'Apple Pay'};
    final icons = {'mada': Icons.credit_card, 'viban': Icons.account_balance, 'apple_pay': Icons.apple};
    final isSelected = _selectedMethod == method;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = method),
      child: Container(
        margin: EdgeInsets.only(bottom: r.h(10)),
        padding: EdgeInsets.all(r.w(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0), width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(r.r(12))),
        child: Row(children: [
          Icon(icons[method], color: const Color(0xFF1B2A4A), size: r.w(24)),
          SizedBox(width: r.w(12)),
          Text(titles[method], style: TextStyle(fontFamily: 'MontserratArabic',
            fontWeight: FontWeight.w700, fontSize: r.sp(13), color: const Color(0xFF1B2A4A))),
          const Spacer(),
          if (isSelected) Icon(Icons.check_circle, color: const Color(0xFF2E5090), size: r.w(20)),
        ]),
      ),
    );
  }
}
