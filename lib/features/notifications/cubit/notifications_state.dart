// lib/features/notifications/cubit/notifications_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/notification.dart';
part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(true) bool isLoading,
    @Default([]) List<AppNotification> notifications,
    @Default(0) int unreadCount,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    String? errorMessage,
  }) = _NotificationsState;
}
