import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});
  @override State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _activeFilter = 'all';
  final _filters = ['all', 'deposits', 'withdrawals', 'investments', 'returns', 'referrals'];

  final _transactions = [
    {'type': 'deposit', 'title': 'Deposit via mada', 'amount': 5000.0, 'date': 'Feb 10, 2026', 'status': 'completed'},
    {'type': 'investment', 'title': 'Al Narjis Villa', 'amount': -2500.0, 'date': 'Feb 8, 2026', 'status': 'completed'},
    {'type': 'return', 'title': 'Monthly Return', 'amount': 125.0, 'date': 'Feb 1, 2026', 'status': 'completed'},
    {'type': 'withdrawal', 'title': 'Withdrawal to IBAN', 'amount': -1000.0, 'date': 'Jan 28, 2026', 'status': 'pending'},
    {'type': 'referral', 'title': 'Referral Bonus', 'amount': 50.0, 'date': 'Jan 25, 2026', 'status': 'completed'},
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = ScreenUtil();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      appBar: AppBar(
        title: Text('Transaction History', style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w700, fontSize: r.sp(16), color: const Color(0xFF1B2A4A))),
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Color(0xFF1B2A4A)),
          onPressed: () => Navigator.pop(context)),
        actions: [IconButton(icon: const Icon(Icons.download, color: Color(0xFF1B2A4A)),
          onPressed: () {})],
      ),
      body: Column(children: [
        // Summary Cards
        Padding(
          padding: EdgeInsets.all(r.w(16)),
          child: Row(children: [
            Expanded(child: _summaryCard('Total In', 'SAR 15,250', const Color(0xFF2D6A4F), r)),
            SizedBox(width: r.w(12)),
            Expanded(child: _summaryCard('Total Out', 'SAR 8,500', const Color(0xFFC62828), r)),
          ]),
        ),
        // Filter Chips
        SizedBox(
          height: r.h(40),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: r.w(16)),
            itemCount: _filters.length,
            itemBuilder: (ctx, i) {
              final isActive = _activeFilter == _filters[i];
              return Padding(
                padding: EdgeInsets.only(right: r.w(8)),
                child: ChoiceChip(
                  label: Text(_filters[i].substring(0, 1).toUpperCase() + _filters[i].substring(1),
                    style: TextStyle(fontFamily: 'MontserratArabic', fontSize: r.sp(11),
                      fontWeight: FontWeight.w600, color: isActive ? Colors.white : const Color(0xFF64748B))),
                  selected: isActive,
                  selectedColor: const Color(0xFF1B2A4A),
                  backgroundColor: Colors.white,
                  onSelected: (s) => setState(() => _activeFilter = _filters[i]),
                ),
              );
            },
          ),
        ),
        SizedBox(height: r.h(12)),
        // Transaction List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: r.w(16)),
            itemCount: _transactions.length,
            itemBuilder: (ctx, i) => _transactionCard(_transactions[i], r),
          ),
        ),
      ]),
    );
  }

  Widget _summaryCard(String label, String value, Color color, ScreenUtil r) {
    return Container(
      padding: EdgeInsets.all(r.w(16)),
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(r.r(12)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(fontFamily: 'MontserratArabic',
          fontSize: r.sp(11), color: const Color(0xFF64748B))),
        SizedBox(height: r.h(4)),
        Text(value, style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w800, fontSize: r.sp(16), color: color)),
      ]),
    );
  }

  Widget _transactionCard(Map<String, dynamic> tx, ScreenUtil r) {
    final colors = {
      'deposit': const Color(0xFF2D6A4F), 'withdrawal': const Color(0xFFC62828),
      'investment': const Color(0xFF2E5090), 'return': const Color(0xFF2D6A4F),
      'referral': const Color(0xFFE65100),
    };
    final icons = {
      'deposit': Icons.arrow_downward, 'withdrawal': Icons.arrow_upward,
      'investment': Icons.trending_up, 'return': Icons.attach_money,
      'referral': Icons.card_giftcard,
    };
    final amount = tx['amount'] as double;
    final color = colors[tx['type']] ?? const Color(0xFF1B2A4A);
    return Container(
      margin: EdgeInsets.only(bottom: r.h(8)),
      padding: EdgeInsets.all(r.w(14)),
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(r.r(12))),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(r.w(10)),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(r.r(10))),
          child: Icon(icons[tx['type']], color: color, size: r.w(18))),
        SizedBox(width: r.w(12)),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(tx['title'], style: TextStyle(fontFamily: 'MontserratArabic',
            fontWeight: FontWeight.w700, fontSize: r.sp(12), color: const Color(0xFF1B2A4A))),
          Text(tx['date'], style: TextStyle(fontFamily: 'MontserratArabic',
            fontSize: r.sp(10), color: const Color(0xFF94A3B8))),
        ])),
        Text('${amount > 0 ? "+" : ""}${amount.toStringAsFixed(0)} SAR',
          style: TextStyle(fontFamily: 'MontserratArabic',
            fontWeight: FontWeight.w800, fontSize: r.sp(13), color: color)),
      ]),
    );
  }
}
