class NotificationModel {
  final String id;
  final String titleAr;
  final String titleEn;
  final String bodyAr;
  final String bodyEn;
  final NotificationType type;
  final bool isRead;
  final String? actionRoute; // deep link route
  final DateTime createdAt;

  const NotificationModel({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.bodyAr,
    required this.bodyEn,
    required this.type,
    required this.isRead,
    this.actionRoute,
    required this.createdAt,
  });
}

enum NotificationType { investment, returns, system, promotion, kyc }
