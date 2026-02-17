// Investment Detail Screen (from Portfolio)
// ==========================================
// Two-phase status per Real Estate Registration (التسجيل العيني للعقار) regulations:
// Phase 1: Processing - after payment, before ownership certificate
// Phase 2: Confirmed - after ownership certificate issued
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum InvestmentStatus { processing, confirmed }

class Investment {
  final String id;
  final String propertyName;
  final String location;
  final InvestmentStatus status;
  final double invested;
  final double currentValue;
  final int tokens;  // v3.0: renamed from shares
  final double annualReturn;
  final DateTime purchaseDate;
  final DateTime? certificateDate;
  final String? certificateNumber;

  Investment({required this.id, required this.propertyName, required this.location,
    required this.status, required this.invested, required this.currentValue,
    required this.tokens, required this.annualReturn, required this.purchaseDate,
    this.certificateDate, this.certificateNumber});

  bool get isConfirmed => status == InvestmentStatus.confirmed;
  double get totalReturn => currentValue - invested;
  double get returnRate => (totalReturn / invested) * 100;
}

class StatusBanner extends StatelessWidget {
  final InvestmentStatus status;
  const StatusBanner({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (status == InvestmentStatus.processing) {
      return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF3C7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFDE68A)),
        ),
        child: Column(children: [
          Row(children: [
            Container(width: 40, height: 40,
              decoration: BoxDecoration(color: const Color(0xFFFDE68A), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.access_time, color: Color(0xFFD97706), size: 20)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Processing Investment', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF92400E))),
              Text('Ownership certificate being processed by Real Estate Registration (5-7 business days).',
                style: TextStyle(fontSize: 10, color: Color(0xFFA16207))),
            ])),
          ]),
          const SizedBox(height: 16),
          Row(children: ['Payment', 'Verification', 'Registration', 'Certificate'].asMap().entries.map((e) {
            final done = e.key < 2;
            final active = e.key == 2;
            return Expanded(child: Column(children: [
              Container(height: 6, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: done ? Color(0xFF2D6A4F) : active ? Color(0xFFD97706) : Color(0xFFE5E7EB))),
              SizedBox(height: 6),
              Text(e.value, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600,
                color: done ? Color(0xFF2D6A4F) : active ? Color(0xFFD97706) : Color(0xFF9CA3AF))),
            ]));
          }).toList()),
        ]),
      );
    }
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFECFDF5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFA7F3D0)),
      ),
      child: Row(children: [
        Container(width: 40, height: 40,
          decoration: BoxDecoration(color: const Color(0xFFA7F3D0), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.check_circle, color: Color(0xFF2D6A4F), size: 20)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Investment Confirmed', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF2D6A4F))),
          Text('Ownership certificate issued by Real Estate Registration.', style: TextStyle(fontSize: 10, color: Color(0xFF065F46))),
        ])),
      ]),
    );
  }
}

// Usage:
// InvestmentDetailScreen(investmentId: 'abc123')
// From Portfolio: onTap: () => Navigator.push(context,
//   MaterialPageRoute(builder: (_) => InvestmentDetailScreen(investmentId: inv.id)))
