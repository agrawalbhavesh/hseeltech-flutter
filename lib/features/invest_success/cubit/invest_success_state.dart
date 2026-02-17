// lib/features/invest/success/cubit/invest_success_state.dart
class InvestSuccessState {
  final String propertyName;
  final double amount;
  final int tokens;  // v3.0: renamed from shares
  final String transactionId;
  final DateTime investedAt;

  const InvestSuccessState({
    required this.propertyName,
    required this.amount,
    required this.tokens,
    required this.transactionId,
    required this.investedAt,
  });
}
