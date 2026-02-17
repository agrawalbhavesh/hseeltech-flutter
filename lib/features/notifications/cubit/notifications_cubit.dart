// lib/features/notifications/cubit/notifications_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/notification_repository.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepository _notifRepo;

  NotificationsCubit(this._notifRepo) : super(const NotificationsState());

  Future<void> loadNotifications({bool refresh = false}) async {
    if (refresh) emit(state.copyWith(currentPage: 1, isLoading: true));
    try {
      final result = await _notifRepo.getAll(page: state.currentPage);
      emit(state.copyWith(
        isLoading: false,
        notifications: refresh ? result.items : [...state.notifications, ...result.items],
        unreadCount: result.unreadCount,
        hasMore: result.hasMore,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> markAsRead(String id) async {
    await _notifRepo.markAsRead(id);
    final updated = state.notifications.map((n) => n.id == id ? n.copyWith(isRead: true) : n).toList();
    emit(state.copyWith(notifications: updated, unreadCount: state.unreadCount - 1));
  }

  Future<void> markAllAsRead() async {
    await _notifRepo.markAllAsRead();
    final updated = state.notifications.map((n) => n.copyWith(isRead: true)).toList();
    emit(state.copyWith(notifications: updated, unreadCount: 0));
  }
}
