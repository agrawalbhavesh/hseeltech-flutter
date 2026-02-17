// ============================================
// Wallet Repository - lib/repositories/wallet_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/wallet.dart';

class WalletRepository extends BaseRepository {
  WalletRepository(ApiClient apiClient) : super(apiClient);
  
  /// Get wallet balance and summary
  Future<Result<WalletInfo>> getWallet() async {
    return safeApiCall(
      () => dio.get('/wallet'),
      (data) => WalletInfo.fromJson(data),
    );
  }
  
  /// Get wallet transaction history
  Future<Result<PaginatedResponse<WalletTransaction>>> getTransactions({
    String? type,  // deposit, withdrawal, investment, distribution
    int page = 1,
    int limit = 20,
  }) async {
    return safePaginatedCall(
      () => dio.get('/wallet/transactions', queryParameters: {
        if (type != null) 'type': type,
        'page': page,
        'limit': limit,
      }),
      (json) => WalletTransaction.fromJson(json),
      'transactions',
    );
  }
  
  /// Initiate deposit
  Future<Result<DepositResult>> deposit({
    required double amount,
    required String paymentMethod, // bank_transfer, mada, apple_pay
  }) async {
    return safeApiCall(
      () => dio.post('/wallet/deposit', data: {
        'amount': amount,
        'payment_method': paymentMethod,
      }),
      (data) => DepositResult.fromJson(data),
    );
  }
  
  /// Initiate withdrawal
  Future<Result<WithdrawResult>> withdraw({
    required double amount,
    required String iban,
  }) async {
    return safeApiCall(
      () => dio.post('/wallet/withdraw', data: {
        'amount': amount,
        'iban': iban,
      }),
      (data) => WithdrawResult.fromJson(data),
    );
  }
}

class DepositResult {
  final String transactionId;
  final String? paymentUrl;
  final String status;
  
  DepositResult({required this.transactionId, this.paymentUrl, required this.status});
  factory DepositResult.fromJson(Map<String, dynamic> json) => DepositResult(
    transactionId: json['transaction_id'], paymentUrl: json['payment_url'], status: json['status'],
  );
}

class WithdrawResult {
  final String transactionId;
  final String status;
  final String estimatedArrival;
  
  WithdrawResult({required this.transactionId, required this.status, required this.estimatedArrival});
  factory WithdrawResult.fromJson(Map<String, dynamic> json) => WithdrawResult(
    transactionId: json['transaction_id'], status: json['status'], estimatedArrival: json['estimated_arrival'],
  );
}
