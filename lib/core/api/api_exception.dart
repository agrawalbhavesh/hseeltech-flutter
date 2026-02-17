// ============================================
// API Exception - lib/core/network/api_exception.dart
// ============================================
// Unified error handling with user-friendly messages in AR/EN

import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ApiException implements Exception {
  final String message;
  final String? messageAr;
  final int? statusCode;
  final String? errorCode;
  final dynamic data;

  const ApiException({
    required this.message,
    this.messageAr,
    this.statusCode,
    this.errorCode,
    this.data,
  });

  /// Factory to convert DioException to ApiException
  factory ApiException.fromDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiException(
          message: 'Connection timed out. Please try again.',
          messageAr: 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.',
          statusCode: 408,
          errorCode: 'TIMEOUT',
        );
      case DioExceptionType.connectionError:
        return const ApiException(
          message: 'No internet connection. Please check your network.',
          messageAr: 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة.',
          statusCode: 0,
          errorCode: 'NO_CONNECTION',
        );
      case DioExceptionType.badResponse:
        return _parseServerError(error.response);
      case DioExceptionType.cancel:
        return const ApiException(
          message: 'Request was cancelled.',
          messageAr: 'تم إلغاء الطلب.',
          errorCode: 'CANCELLED',
        );
      default:
        return const ApiException(
          message: 'An unexpected error occurred.',
          messageAr: 'حدث خطأ غير متوقع.',
          errorCode: 'UNKNOWN',
        );
    }
  }

  static ApiException _parseServerError(Response? response) {
    if (response == null) {
      return const ApiException(
        message: 'No response from server.',
        messageAr: 'لا توجد استجابة من الخادم.',
        errorCode: 'NO_RESPONSE',
      );
    }

    final data = response.data;
    final statusCode = response.statusCode ?? 500;

    // Parse server error response
    String message = 'Server error';
    String? messageAr;
    String? errorCode;

    if (data is Map<String, dynamic>) {
      message = data['message'] ?? data['error'] ?? 'Server error';
      messageAr = data['message_ar'];
      errorCode = data['error_code'];
    }

    // Map common HTTP status codes
    switch (statusCode) {
      case 400:
        return ApiException(
          message: message,
          messageAr: messageAr ?? 'طلب غير صالح.',
          statusCode: 400,
          errorCode: errorCode ?? 'BAD_REQUEST',
          data: data,
        );
      case 401:
        return ApiException(
          message: 'Session expired. Please login again.',
          messageAr: 'انتهت الجلسة. يرجى تسجيل الدخول مرة أخرى.',
          statusCode: 401,
          errorCode: 'UNAUTHORIZED',
        );
      case 403:
        return ApiException(
          message: 'You do not have permission to perform this action.',
          messageAr: 'ليس لديك صلاحية لتنفيذ هذا الإجراء.',
          statusCode: 403,
          errorCode: 'FORBIDDEN',
        );
      case 404:
        return ApiException(
          message: message,
          messageAr: messageAr ?? 'المورد المطلوب غير موجود.',
          statusCode: 404,
          errorCode: errorCode ?? 'NOT_FOUND',
        );
      case 409:
        return ApiException(
          message: message,
          messageAr: messageAr ?? 'تعارض في البيانات.',
          statusCode: 409,
          errorCode: errorCode ?? 'CONFLICT',
        );
      case 422:
        return ApiException(
          message: message,
          messageAr: messageAr ?? 'بيانات غير صالحة.',
          statusCode: 422,
          errorCode: errorCode ?? 'VALIDATION_ERROR',
          data: data,
        );
      case 429:
        return ApiException(
          message: 'Too many requests. Please wait a moment.',
          messageAr: 'طلبات كثيرة جداً. يرجى الانتظار لحظة.',
          statusCode: 429,
          errorCode: 'RATE_LIMITED',
        );
      default:
        if (statusCode >= 500) {
          return ApiException(
            message: 'Server error. Please try again later.',
            messageAr: 'خطأ في الخادم. يرجى المحاولة لاحقاً.',
            statusCode: statusCode,
            errorCode: 'SERVER_ERROR',
          );
        }
        return ApiException(
          message: message,
          messageAr: messageAr,
          statusCode: statusCode,
          errorCode: errorCode,
        );
    }
  }

  /// Get localized message based on current locale
  String localizedMessage(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'ar' ? (messageAr ?? message) : message;
  }

  @override
  String toString() => 'ApiException($statusCode): $message [$errorCode]';
}

// ============================================
// Result Type - lib/core/network/result.dart
// ============================================
// Type-safe result wrapper for API calls

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final ApiException exception;
  const Failure(this.exception);
}

// Extension for easy pattern matching
extension ResultExtension<T> on Result<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiException exception) failure,
  }) {
    return switch (this) {
      Success<T>(data: final d) => success(d),
      Failure<T>(exception: final e) => failure(e),
    };
  }
}
