import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});
  @override State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  double _amount = 0;
  final _balance = 24500.0;
  bool get _isOverLimit => _amount > _balance;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = ScreenUtil();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        title: Text('Withdraw', style: TextStyle(fontFamily: 'MontserratArabic',
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
              Text('SAR ${_balance.toStringAsFixed(2)}', style: TextStyle(fontFamily: 'MontserratArabic',
                fontWeight: FontWeight.w800, fontSize: r.sp(24), color: Colors.white)),
            ]),
          ),
          SizedBox(height: r.h(20)),
          // Amount Input
          Container(
            padding: EdgeInsets.all(r.w(20)),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: _isOverLimit ? const Color(0xFFC62828) : const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(r.r(16))),
            child: Column(children: [
              Text('Withdrawal Amount', style: TextStyle(fontFamily: 'MontserratArabic',
                fontWeight: FontWeight.w600, fontSize: r.sp(13), color: const Color(0xFF64748B))),
              SizedBox(height: r.h(12)),
              Text('SAR ${_amount > 0 ? _amount.toStringAsFixed(0) : "0"}',
                style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w800, fontSize: r.sp(36),
                  color: _isOverLimit ? const Color(0xFFC62828) : const Color(0xFF1B2A4A))),
              if (_isOverLimit) Padding(
                padding: EdgeInsets.only(top: r.h(8)),
                child: Text('Exceeds available balance', style: TextStyle(fontFamily: 'MontserratArabic',
                  color: const Color(0xFFC62828), fontSize: r.sp(11)))),
              SizedBox(height: r.h(12)),
              TextButton(onPressed: () => setState(() => _amount = _balance),
                child: Text('Withdraw All', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w700, fontSize: r.sp(12), color: const Color(0xFF2E5090)))),
            ]),
          ),
          SizedBox(height: r.h(20)),
          // IBAN Destination Card
          Container(
            padding: EdgeInsets.all(r.w(16)),
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(r.r(12))),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(r.w(10)),
                decoration: BoxDecoration(color: const Color(0xFFEDF2F9),
                  borderRadius: BorderRadius.circular(r.r(10))),
                child: Icon(Icons.account_balance, color: const Color(0xFF1B2A4A), size: r.w(20))),
              SizedBox(width: r.w(12)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Al Rajhi Bank', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w700, fontSize: r.sp(13), color: const Color(0xFF1B2A4A))),
                Text('SA03 8000 **** **** 7823', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w700, fontSize: r.sp(11), color: const Color(0xFF64748B),
                  letterSpacing: 1)),
              ]),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: r.w(8), vertical: r.h(4)),
                decoration: BoxDecoration(color: const Color(0xFF2D6A4F).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(r.r(6))),
                child: Text('Verified', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w700, fontSize: r.sp(9), color: const Color(0xFF2D6A4F)))),
            ]),
          ),
          SizedBox(height: r.h(12)),
          // Processing Notice
          Container(
            padding: EdgeInsets.all(r.w(12)),
            decoration: BoxDecoration(color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(r.r(8))),
            child: Row(children: [
              Icon(Icons.access_time, color: const Color(0xFFE65100), size: r.w(16)),
              SizedBox(width: r.w(8)),
              Text('Processing: 1-3 business days', style: TextStyle(fontFamily: 'MontserratArabic',
                fontSize: r.sp(11), color: const Color(0xFFE65100))),
            ]),
          ),
          SizedBox(height: r.h(20)),
          // Withdraw Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B2A4A),
              padding: EdgeInsets.symmetric(vertical: r.h(16)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.r(12)))),
            child: Text('Withdraw SAR ${_amount.toStringAsFixed(0)}',
              style: TextStyle(fontFamily: 'MontserratArabic',
                fontWeight: FontWeight.w700, fontSize: r.sp(14), color: Colors.white)),
          ),
        ]),
      ),
    );
  }
}
