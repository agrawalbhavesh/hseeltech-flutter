// ============================================
// API Client - lib/core/network/api_client.dart
// ============================================
// Base Dio client with interceptors, token management, and error handling

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiClient {
  static const String baseUrl = 'https://api.hseeltech.com/api/v1';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  
  late final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Platform': 'mobile',
        'X-App-Version': '1.0.0',
      },
    ));
    
    _dio.interceptors.addAll([
      _AuthInterceptor(_storage),
      _LanguageInterceptor(),
      _ConnectivityInterceptor(),
      _RetryInterceptor(_dio),
      if (kDebugMode) _LoggingInterceptor(),
    ]);
  }
  
  Dio get dio => _dio;
}

// ============================================
// Auth Interceptor - Adds JWT token to requests
// ============================================
class _AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  
  _AuthInterceptor(this._storage);
  
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth for public endpoints
    final publicPaths = ['/auth/nafath/initiate', '/auth/nafath/status'];
    if (publicPaths.any((p) => options.path.contains(p))) {
      return handler.next(options);
    }
    
    final token = await _storage.read(key: 'access_token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
  
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Try to refresh token
      final refreshToken = await _storage.read(key: 'refresh_token');
      if (refreshToken != null) {
        try {
          final response = await Dio().post(
            '${ApiClient.baseUrl}/auth/refresh',
            data: {'refresh_token': refreshToken},
          );
          final newToken = response.data['access_token'] as String;
          await _storage.write(key: 'access_token', value: newToken);
          
          // Retry original request with new token
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          final retryResponse = await Dio().fetch(err.requestOptions);
          return handler.resolve(retryResponse);
        } catch (_) {
          // Refresh failed - clear tokens and redirect to login
          await _storage.deleteAll();
          // Navigate to login screen via global navigator key
        }
      }
    }
    return handler.next(err);
  }
}

// ============================================
// Language Interceptor - Adds Accept-Language header
// ============================================
class _LanguageInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get current locale from app settings
    final locale = _getCurrentLocale(); // 'ar' or 'en'
    options.headers['Accept-Language'] = locale;
    handler.next(options);
  }
  
  String _getCurrentLocale() {
    // In production, read from SharedPreferences or locale provider
    return 'ar'; // Default Arabic
  }
}

// ============================================
// Connectivity Interceptor - Check network before requests
// ============================================
class _ConnectivityInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'No internet connection',
        ),
      );
    }
    handler.next(options);
  }
}

// ============================================
// Retry Interceptor - Auto-retry on network errors
// ============================================
class _RetryInterceptor extends Interceptor {
  final Dio _dio;
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  
  _RetryInterceptor(this._dio);
  
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final shouldRetry = err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.response?.statusCode != null && err.response!.statusCode! >= 500);
    
    if (!shouldRetry) return handler.next(err);
    
    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;
    if (retryCount >= maxRetries) return handler.next(err);
    
    await Future.delayed(retryDelay * (retryCount + 1)); // Exponential backoff
    err.requestOptions.extra['retryCount'] = retryCount + 1;
    
    try {
      final response = await _dio.fetch(err.requestOptions);
      return handler.resolve(response);
    } catch (e) {
      return handler.next(err);
    }
  }
}

// ============================================
// Logging Interceptor - Debug only
// ============================================
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('┌── API Request ──────────────────────');
    debugPrint('│ ${options.method} ${options.uri}');
    if (options.data != null) debugPrint('│ Body: ${options.data}');
    debugPrint('└─────────────────────────────────────');
    handler.next(options);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('┌── API Response ─────────────────────');
    debugPrint('│ ${response.statusCode} ${response.requestOptions.uri}');
    debugPrint('│ Data: ${response.data.toString().substring(0, 200.clamp(0, response.data.toString().length))}...');
    debugPrint('└─────────────────────────────────────');
    handler.next(response);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('┌── API Error ────────────────────────');
    debugPrint('│ ${err.response?.statusCode} ${err.requestOptions.uri}');
    debugPrint('│ Message: ${err.message}');
    debugPrint('└─────────────────────────────────────');
    handler.next(err);
  }
}
