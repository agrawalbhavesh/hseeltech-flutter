// ============================================
// User Repository - lib/repositories/user_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/user.dart';

class UserRepository extends BaseRepository {
  UserRepository(ApiClient apiClient) : super(apiClient);
  
  /// Get current user profile
  Future<Result<User>> getProfile() async {
    return safeApiCall(
      () => dio.get('/user/profile'),
      (data) => User.fromJson(data),
    );
  }
  
  /// Update user profile
  Future<Result<User>> updateProfile({
    String? email,
    String? phone,
    String? avatarUrl,
  }) async {
    return safeApiCall(
      () => dio.patch('/user/profile', data: {
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (avatarUrl != null) 'avatar_url': avatarUrl,
      }),
      (data) => User.fromJson(data['user']),
    );
  }
  
  /// Setup PIN code
  Future<Result<bool>> setupPin(String pin, String confirmPin) async {
    return safeApiCall(
      () => dio.post('/user/pin/setup', data: {
        'pin': pin,
        'confirm_pin': confirmPin,
      }),
      (data) => data['success'] == true,
    );
  }
  
  /// Verify PIN code
  Future<Result<String>> verifyPin(String pin) async {
    return safeApiCall(
      () => dio.post('/user/pin/verify', data: {'pin': pin}),
      (data) => data['token'] as String,
    );
  }
  
  /// Enable/disable biometric authentication
  Future<Result<bool>> toggleBiometric(bool enabled) async {
    return safeApiCall(
      () => dio.patch('/user/settings', data: {'biometric_enabled': enabled}),
      (data) => data['success'] == true,
    );
  }
}
