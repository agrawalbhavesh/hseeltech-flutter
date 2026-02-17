import 'package:hseeltech/models/property.dart';

class InvestmentModel {
  final String id;
  final String userId;
  final String propertyId;
  final PropertyModel? property; // populated from API
  final int tokenCount;
  final double totalAmount; // SAR
  final double currentValue; // SAR (with returns)
  final double totalReturns; // SAR
  final InvestmentStatus status;
  final DateTime purchaseDate;
  final DateTime? nextDistributionDate;
  final double? nextDistributionAmount;

  const InvestmentModel({
    required this.id,
    required this.userId,
    required this.propertyId,
    this.property,
    required this.tokenCount,
    required this.totalAmount,
    required this.currentValue,
    required this.totalReturns,
    required this.status,
    required this.purchaseDate,
    this.nextDistributionDate,
    this.nextDistributionAmount,
  });

  double get returnPercentage => (totalReturns / totalAmount) * 100;
}

enum InvestmentStatus { active, pending, completed, cancelled }
