import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// BankAccountScreen — v3.0 Updated
/// - Beneficiary name auto-filled from Nafath (read-only)
/// - IBAN verification via Open Banking with Arab Bank
/// - Account only accepted after successful verification

enum VerificationStep { idle, verifying, verified, failed }

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({super.key});
  @override State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  bool _showAddForm = false;
  final _ibanCtrl = TextEditingController();
  String _selectedBank = '';
  VerificationStep _verificationStep = VerificationStep.idle;
  double _verificationProgress = 0;

  // Auto-filled from Nafath registration data (read-only)
  final String _nafathName = 'Mohammed Al-Abdullah Al-Rashidi';

  final List<Map<String, String>> _banks = [
    {'name': 'Al Rajhi Bank', 'iban': 'SA03 8000 0000 6080 1016 7519',
     'holder': 'Mohammed Al-Abdullah Al-Rashidi', 'status': 'verified'},
  ];
  final List<String> _bankOptions = [
    'Al Rajhi Bank', 'SNB (Al Ahli)', 'Riyad Bank', 'SABB',
    'Banque Saudi Fransi', 'Arab National Bank', 'Alinma Bank', 'Bank AlJazira'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = ScreenUtil();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        title: Text('Bank Account', style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w700, fontSize: r.sp(16), color: const Color(0xFF1B2A4A))),
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1B2A4A)),
          onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(padding: EdgeInsets.all(r.w(20)), children: [
        ..._banks.map((bank) => _buildBankCard(r, bank)),
        SizedBox(height: r.h(16)),
        if (!_showAddForm)
          GestureDetector(
            onTap: () => setState(() => _showAddForm = true),
            child: Container(
              padding: EdgeInsets.all(r.w(20)),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF2E5090), width: 1.5),
                borderRadius: BorderRadius.circular(r.r(16)), color: Colors.white),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.add_circle_outline, color: const Color(0xFF2E5090), size: r.w(20)),
                SizedBox(width: r.w(8)),
                Text('Add New Bank Account', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontWeight: FontWeight.w600, fontSize: r.sp(13), color: const Color(0xFF2E5090))),
              ]),
            ),
          ),
        if (_showAddForm) _buildAddForm(r),
        SizedBox(height: r.h(16)),
        Container(
          padding: EdgeInsets.all(r.w(12)),
          decoration: BoxDecoration(color: const Color(0xFFFEF3C7),
            borderRadius: BorderRadius.circular(r.r(12))),
          child: Row(children: [
            Icon(Icons.info_outline, color: const Color(0xFFF59E0B), size: r.w(16)),
            SizedBox(width: r.w(8)),
            Expanded(child: Text('Bank account must be in your name for withdrawals',
              style: TextStyle(fontFamily: 'MontserratArabic', fontSize: r.sp(11),
                color: const Color(0xFF92400E)))),
          ]),
        ),
      ]),
    );
  }

  Widget _buildBankCard(ScreenUtil r, Map<String, String> bank) {
    return Container(
      margin: EdgeInsets.only(bottom: r.h(12)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B2A4A), Color(0xFF2E5090), Color(0xFF4A7BC7)]),
        borderRadius: BorderRadius.circular(r.r(16))),
      padding: EdgeInsets.all(r.w(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(bank['name']!, style: TextStyle(fontFamily: 'MontserratArabic',
            fontWeight: FontWeight.w700, fontSize: r.sp(14), color: Colors.white)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: r.w(8), vertical: r.h(3)),
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(r.r(8))),
            child: Text('Verified', style: TextStyle(fontFamily: 'MontserratArabic',
              fontSize: r.sp(10), fontWeight: FontWeight.w600, color: const Color(0xFF22C55E)))),
        ]),
        SizedBox(height: r.h(12)),
        Text(bank['iban']!, style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w500, fontSize: r.sp(13),
          color: Colors.white.withValues(alpha: 0.9), letterSpacing: 1.2)),
        SizedBox(height: r.h(8)),
        Text(bank['holder']!, style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w600, fontSize: r.sp(14), color: Colors.white)),
      ]),
    );
  }

  /// Simulate Open Banking IBAN verification with Arab Bank
  void _verifyIban() {
    if (_selectedBank.isEmpty || _ibanCtrl.text.replaceAll(' ', '').length < 24) return;
    setState(() { _verificationStep = VerificationStep.verifying; _verificationProgress = 0; });
    // Simulate 4-step progress
    Future.delayed(const Duration(milliseconds: 600), () => setState(() => _verificationProgress = 0.25));
    Future.delayed(const Duration(milliseconds: 1200), () => setState(() => _verificationProgress = 0.50));
    Future.delayed(const Duration(milliseconds: 2000), () => setState(() => _verificationProgress = 0.80));
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() { _verificationProgress = 1.0; _verificationStep = VerificationStep.verified; });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('IBAN verified successfully via Open Banking')));
    });
  }

  Widget _buildAddForm(ScreenUtil r) {
    return Container(
      margin: EdgeInsets.only(top: r.h(12)),
      padding: EdgeInsets.all(r.w(16)),
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(r.r(16)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Add New Bank', style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w700, fontSize: r.sp(14), color: const Color(0xFF1B2A4A))),
        SizedBox(height: r.h(16)),

        // === Beneficiary Name (Auto-filled from Nafath — Read-Only) ===
        Text('Account Holder Name', style: TextStyle(fontFamily: 'MontserratArabic',
          fontSize: r.sp(11), fontWeight: FontWeight.w600, color: const Color(0xFF6B7280))),
        SizedBox(height: r.h(6)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: r.w(14), vertical: r.h(12)),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            borderRadius: BorderRadius.circular(r.r(12))),
          child: Row(children: [
            Expanded(child: Text(_nafathName, style: TextStyle(fontFamily: 'MontserratArabic',
              fontSize: r.sp(13), fontWeight: FontWeight.w600, color: const Color(0xFF1B1B1B)))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: r.w(6), vertical: r.h(3)),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(r.r(6))),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.lock, size: r.w(10), color: const Color(0xFF2E5090)),
                SizedBox(width: r.w(3)),
                Text('Nafath', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontSize: r.sp(9), fontWeight: FontWeight.w700, color: const Color(0xFF2E5090))),
              ])),
          ]),
        ),
        SizedBox(height: r.h(4)),
        Row(children: [
          Icon(Icons.shield, size: r.w(12), color: const Color(0xFF9CA3AF)),
          SizedBox(width: r.w(4)),
          Text('Name auto-filled from Nafath identity data at registration',
            style: TextStyle(fontFamily: 'MontserratArabic',
              fontSize: r.sp(9), color: const Color(0xFF9CA3AF))),
        ]),
        SizedBox(height: r.h(16)),

        // === Bank Selection ===
        DropdownButtonFormField<String>(
          value: _selectedBank.isEmpty ? null : _selectedBank,
          items: _bankOptions.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
          onChanged: (v) => setState(() {
            _selectedBank = v!;
            if (_verificationStep != VerificationStep.idle) {
              _verificationStep = VerificationStep.idle; _verificationProgress = 0;
            }
          }),
          decoration: InputDecoration(labelText: 'Select Bank',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(r.r(12))))),
        SizedBox(height: r.h(12)),

        // === IBAN Input ===
        TextFormField(
          controller: _ibanCtrl,
          decoration: InputDecoration(labelText: 'IBAN Number',
            hintText: 'SA00 0000 0000 0000 0000 00', prefixText: 'SA ',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(r.r(12)),
              borderSide: BorderSide(color: _verificationStep == VerificationStep.verified
                ? const Color(0xFF22C55E) : const Color(0xFFE2E8F0)))),
          keyboardType: TextInputType.number, maxLength: 22,
          onChanged: (_) => setState(() {
            if (_verificationStep != VerificationStep.idle) {
              _verificationStep = VerificationStep.idle; _verificationProgress = 0;
            }
          })),
        SizedBox(height: r.h(16)),

        // === Open Banking Verification Section ===
        Container(
          padding: EdgeInsets.all(r.w(12)),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F7FF),
            border: Border.all(color: const Color(0xFFBFDBFE)),
            borderRadius: BorderRadius.circular(r.r(12))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                padding: EdgeInsets.all(r.w(6)),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E5090),
                  borderRadius: BorderRadius.circular(r.r(8))),
                child: Icon(Icons.shield, size: r.w(16), color: Colors.white)),
              SizedBox(width: r.w(8)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Open Banking Verification', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontSize: r.sp(11), fontWeight: FontWeight.w700, color: const Color(0xFF1B2A4A))),
                Text('Via Arab Bank integration', style: TextStyle(fontFamily: 'MontserratArabic',
                  fontSize: r.sp(9), color: const Color(0xFF2E5090))),
              ]),
            ]),
            if (_verificationStep == VerificationStep.verifying) ...[
              SizedBox(height: r.h(12)),
              LinearProgressIndicator(value: _verificationProgress,
                backgroundColor: const Color(0xFFDBEAFE), color: const Color(0xFF2E5090)),
              SizedBox(height: r.h(8)),
              _buildVerifyStep(r, 'Validating IBAN format', _verificationProgress >= 0.25),
              _buildVerifyStep(r, 'Connecting to Arab Bank (Open Banking)', _verificationProgress >= 0.50),
              _buildVerifyStep(r, 'Matching data with Nafath', _verificationProgress >= 0.80),
              _buildVerifyStep(r, 'Final verification', _verificationProgress >= 1.0),
            ],
            if (_verificationStep == VerificationStep.verified) ...[
              SizedBox(height: r.h(8)),
              Container(
                padding: EdgeInsets.all(r.w(8)),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(r.r(8))),
                child: Row(children: [
                  Icon(Icons.check_circle, size: r.w(16), color: const Color(0xFF22C55E)),
                  SizedBox(width: r.w(6)),
                  Text('IBAN verified and matches Nafath data',
                    style: TextStyle(fontFamily: 'MontserratArabic',
                      fontSize: r.sp(10), fontWeight: FontWeight.w600, color: const Color(0xFF166534))),
                ])),
            ],
          ]),
        ),
        SizedBox(height: r.h(16)),

        // === Action Button (changes based on verification state) ===
        if (_verificationStep == VerificationStep.idle)
          SizedBox(width: double.infinity, child: ElevatedButton.icon(
            onPressed: _verifyIban,
            icon: const Icon(Icons.shield, size: 16),
            label: Text('Verify IBAN via Open Banking', style: TextStyle(fontFamily: 'MontserratArabic',
              fontWeight: FontWeight.w700, fontSize: r.sp(13), color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E5090),
              padding: EdgeInsets.symmetric(vertical: r.h(14)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.r(12)))))),
        if (_verificationStep == VerificationStep.verified)
          SizedBox(width: double.infinity, child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Bank account added successfully')));
              setState(() { _showAddForm = false; _ibanCtrl.clear(); _selectedBank = '';
                _verificationStep = VerificationStep.idle; _verificationProgress = 0; });
            },
            icon: const Icon(Icons.check_circle, size: 16),
            label: Text('Add Bank Account', style: TextStyle(fontFamily: 'MontserratArabic',
              fontWeight: FontWeight.w700, fontSize: r.sp(14), color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B2A4A),
              padding: EdgeInsets.symmetric(vertical: r.h(14)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.r(12)))))),
      ]),
    );
  }

  Widget _buildVerifyStep(ScreenUtil r, String label, bool done) {
    return Padding(
      padding: EdgeInsets.only(bottom: r.h(4)),
      child: Row(children: [
        Icon(done ? Icons.check_circle : Icons.hourglass_empty,
          size: r.w(12), color: done ? const Color(0xFF22C55E) : const Color(0xFF9CA3AF)),
        SizedBox(width: r.w(6)),
        Text(label, style: TextStyle(fontFamily: 'MontserratArabic',
          fontSize: r.sp(9), color: done ? const Color(0xFF22C55E) : const Color(0xFF9CA3AF))),
      ]),
    );
  }
}
