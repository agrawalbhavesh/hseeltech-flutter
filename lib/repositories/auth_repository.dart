// ============================================
// Auth Repository - lib/repositories/auth_repository.dart
// ============================================

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/user.dart';

class AuthRepository extends BaseRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  AuthRepository(ApiClient apiClient) : super(apiClient);
  
  /// Initiate Nafath verification
  /// [type] = 'login' | 'register'
  Future<Result<NafathSession>> initiateNafath({
    required String nationalId,
    required String type,
  }) async {
    return safeApiCall(
      () => dio.post('/auth/nafath/initiate', data: {
        'national_id': nationalId,
        'type': type,
      }),
      (data) => NafathSession.fromJson(data),
    );
  }
  
  /// Poll Nafath verification status
  /// Call every 3-5 seconds until status != 'pending'
  Future<Result<NafathStatus>> checkNafathStatus(String sessionId) async {
    return safeApiCall(
      () => dio.get('/auth/nafath/status/$sessionId'),
      (data) => NafathStatus.fromJson(data),
    );
  }
  
  /// Save auth tokens after successful verification
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }
  
  /// Logout and clear tokens
  Future<Result<bool>> logout() async {
    final result = await safeApiCall(
      () => dio.post('/auth/logout'),
      (data) => true,
    );
    await _storage.deleteAll();
    return result;
  }
  
  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await _storage.read(key: 'access_token');
    return token != null;
  }
}

// Supporting models
class NafathSession {
  final String sessionId;
  final int nafathNumber;
  final int expiresIn;
  
  NafathSession({required this.sessionId, required this.nafathNumber, required this.expiresIn});
  
  factory NafathSession.fromJson(Map<String, dynamic> json) => NafathSession(
    sessionId: json['session_id'],
    nafathNumber: json['nafath_number'],
    expiresIn: json['expires_in'],
  );
}

class NafathStatus {
  final String status; // pending, verified, rejected, expired
  final User? user;
  final String? token;
  
  NafathStatus({required this.status, this.user, this.token});
  
  factory NafathStatus.fromJson(Map<String, dynamic> json) => NafathStatus(
    status: json['status'],
    user: json['user'] != null ? User.fromJson(json['user']) : null,
    token: json['token'],
  );
}
