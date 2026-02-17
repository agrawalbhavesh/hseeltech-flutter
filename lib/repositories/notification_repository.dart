// ============================================
// Notification Repository - lib/repositories/notification_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/notification.dart' as app;

class NotificationRepository extends BaseRepository {
  NotificationRepository(ApiClient apiClient) : super(apiClient);
  
  /// Get user notifications
  Future<Result<NotificationList>> getNotifications({int page = 1, int limit = 20}) async {
    return safeApiCall(
      () => dio.get('/notifications', queryParameters: {'page': page, 'limit': limit}),
      (data) => NotificationList.fromJson(data),
    );
  }
  
  /// Mark notification as read
  Future<Result<bool>> markAsRead(String notificationId) async {
    return safeApiCall(
      () => dio.patch('/notifications/$notificationId/read'),
      (data) => data['success'] == true,
    );
  }
  
  /// Mark all notifications as read
  Future<Result<bool>> markAllAsRead() async {
    return safeApiCall(
      () => dio.patch('/notifications/read-all'),
      (data) => data['success'] == true,
    );
  }
  
  /// Register device for push notifications
  Future<Result<bool>> registerDevice({
    required String fcmToken,
    required String platform,
  }) async {
    return safeApiCall(
      () => dio.post('/notifications/register-device', data: {
        'fcm_token': fcmToken,
        'platform': platform,
      }),
      (data) => data['success'] == true,
    );
  }
}

class NotificationList {
  final List<app.AppNotification> notifications;
  final int unreadCount;
  
  NotificationList({required this.notifications, required this.unreadCount});
  factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
    notifications: (json['notifications'] as List).map((n) => app.AppNotification.fromJson(n)).toList(),
    unreadCount: json['unread_count'] ?? 0,
  );
}
