// ============================================
// Base Repository - lib/core/network/base_repository.dart
// ============================================
// Abstract base with safe API call wrapper

import 'package:dio/dio.dart';
import 'api_client.dart';
import 'api_exception.dart';

abstract class BaseRepository {
  final ApiClient _apiClient;
  
  BaseRepository(this._apiClient);
  
  Dio get dio => _apiClient.dio;
  
  /// Wraps API calls with error handling
  /// Returns Result<T> - either Success or Failure
  Future<Result<T>> safeApiCall<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic data) parser,
  ) async {
    try {
      final response = await apiCall();
      final parsed = parser(response.data);
      return Success(parsed);
    } on DioException catch (e) {
      return Failure(ApiException.fromDio(e));
    } catch (e) {
      return Failure(ApiException(
        message: 'Unexpected error: ${e.toString()}',
        messageAr: 'خطأ غير متوقع: ${e.toString()}',
        errorCode: 'PARSE_ERROR',
      ));
    }
  }
  
  /// Wraps API calls that return paginated lists
  Future<Result<PaginatedResponse<T>>> safePaginatedCall<T>(
    Future<Response> Function() apiCall,
    T Function(Map<String, dynamic>) itemParser,
    String listKey,
  ) async {
    try {
      final response = await apiCall();
      final data = response.data as Map<String, dynamic>;
      final items = (data[listKey] as List)
          .map((e) => itemParser(e as Map<String, dynamic>))
          .toList();
      return Success(PaginatedResponse(
        items: items,
        total: data['total'] ?? items.length,
        page: data['page'] ?? 1,
        hasMore: (data['page'] ?? 1) < ((data['total'] ?? 0) / (data['limit'] ?? 20)).ceil(),
      ));
    } on DioException catch (e) {
      return Failure(ApiException.fromDio(e));
    } catch (e) {
      return Failure(ApiException(
        message: 'Parse error: ${e.toString()}',
        messageAr: 'خطأ في تحليل البيانات',
        errorCode: 'PARSE_ERROR',
      ));
    }
  }
}

class PaginatedResponse<T> {
  final List<T> items;
  final int total;
  final int page;
  final bool hasMore;
  
  const PaginatedResponse({
    required this.items,
    required this.total,
    required this.page,
    required this.hasMore,
  });
}
