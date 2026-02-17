// ============================================
// Referral Repository - lib/repositories/referral_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/reward.dart';

class ReferralRepository extends BaseRepository {
  ReferralRepository(ApiClient apiClient) : super(apiClient);
  
  /// Get referral statistics and code
  Future<Result<ReferralStats>> getStats() async {
    return safeApiCall(
      () => dio.get('/referrals/stats'),
      (data) => ReferralStats.fromJson(data),
    );
  }
  
  /// Get referral history
  Future<Result<List<Referral>>> getHistory() async {
    return safeApiCall(
      () => dio.get('/referrals/history'),
      (data) => (data['referrals'] as List)
          .map((r) => Referral.fromJson(r))
          .toList(),
    );
  }
}
