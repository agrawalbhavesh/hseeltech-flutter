// ============================================
// Investment Repository - lib/repositories/investment_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/investment.dart';

class InvestmentRepository extends BaseRepository {
  InvestmentRepository(ApiClient apiClient) : super(apiClient);
  
  /// Create new investment (purchase tokens)
  Future<Result<InvestmentResult>> invest({
    required String propertyId,
    required int tokens,
    required String paymentMethod, // 'wallet', 'bank_transfer', 'mada', 'apple_pay'
  }) async {
    return safeApiCall(
      () => dio.post('/investments', data: {
        'property_id': propertyId,
        'tokens': tokens,
        'payment_method': paymentMethod,
      }),
      (data) => InvestmentResult.fromJson(data),
    );
  }
  
  /// Get user's investment portfolio
  Future<Result<Portfolio>> getPortfolio() async {
    return safeApiCall(
      () => dio.get('/investments/portfolio'),
      (data) => Portfolio.fromJson(data),
    );
  }
  
  /// Get single investment detail
  Future<Result<InvestmentDetail>> getDetail(String investmentId) async {
    return safeApiCall(
      () => dio.get('/investments/$investmentId'),
      (data) => InvestmentDetail.fromJson(data),
    );
  }
}

class InvestmentResult {
  final String investmentId;
  final String transactionRef;
  final int tokens;  // v3.0: renamed from shares
  final double totalAmount;
  final String status;
  
  InvestmentResult({required this.investmentId, required this.transactionRef, required this.tokens, required this.totalAmount, required this.status});
  factory InvestmentResult.fromJson(Map<String, dynamic> json) => InvestmentResult(
    investmentId: json['investment_id'], transactionRef: json['transaction_ref'],
    tokens: json['tokens'], totalAmount: (json['total_amount'] as num).toDouble(), status: json['status'],
  );
}

class Portfolio {
  final double totalInvested;
  final double currentValue;
  final double totalReturns;
  final double returnPercentage;
  final List<Investment> investments;
  
  Portfolio({required this.totalInvested, required this.currentValue, required this.totalReturns, required this.returnPercentage, required this.investments});
  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
    totalInvested: (json['total_invested'] as num).toDouble(),
    currentValue: (json['current_value'] as num).toDouble(),
    totalReturns: (json['total_returns'] as num).toDouble(),
    returnPercentage: (json['return_percentage'] as num).toDouble(),
    investments: (json['investments'] as List).map((i) => Investment.fromJson(i)).toList(),
  );
}

class InvestmentDetail {
  final String id;
  final Map<String, dynamic> property;
  final int tokens;  // v3.0: renamed from shares
  final double tokenPrice;
  final double totalAmount;
  final double currentValue;
  final String status;
  final String transactionRef;
  final DateTime investedAt;
  final List<Distribution> distributions;
  
  InvestmentDetail({required this.id, required this.property, required this.tokens, required this.tokenPrice, required this.totalAmount, required this.currentValue, required this.status, required this.transactionRef, required this.investedAt, required this.distributions});
  factory InvestmentDetail.fromJson(Map<String, dynamic> json) => InvestmentDetail(
    id: json['id'], property: json['property'], tokens: json['tokens'],
    tokenPrice: (json['token_price'] as num).toDouble(), totalAmount: (json['total_amount'] as num).toDouble(),
    currentValue: (json['current_value'] as num).toDouble(), status: json['status'],
    transactionRef: json['transaction_ref'], investedAt: DateTime.parse(json['invested_at']),
    distributions: (json['distributions'] as List? ?? []).map((d) => Distribution.fromJson(d)).toList(),
  );
}

class Distribution {
  final DateTime date;
  final double amount;
  Distribution({required this.date, required this.amount});
  factory Distribution.fromJson(Map<String, dynamic> json) => Distribution(
    date: DateTime.parse(json['date']), amount: (json['amount'] as num).toDouble(),
  );
}
