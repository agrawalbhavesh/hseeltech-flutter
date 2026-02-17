class TransactionModel {
  final String id;
  final String userId;
  final TransactionType type;
  final double amount; // SAR
  final TransactionStatus status;
  final String? method; // "bank_transfer", "wallet", etc.
  final String? reference;
  final String? descriptionAr;
  final String? descriptionEn;
  final DateTime createdAt;

  const TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.status,
    this.method,
    this.reference,
    this.descriptionAr,
    this.descriptionEn,
    required this.createdAt,
  });
}

enum TransactionType { deposit, withdrawal, investment, returns, referralBonus }

enum TransactionStatus { pending, completed, failed, cancelled }
