import 'package:hseeltech/models/property.dart';

class PortfolioSummary {
  final double totalValue; // SAR (invested + returns)
  final double totalInvested; // SAR
  final double totalReturns; // SAR
  final double availableBalance; // SAR
  final int propertyCount;
  final double averageReturn; // percentage
  final int confirmedCount; // verified investments
  final int totalCount;
  final DateTime? nextDistributionDate;
  final double? nextDistributionAmount;
  final Map<PropertyType, double> distribution; // type -> percentage

  const PortfolioSummary({
    required this.totalValue,
    required this.totalInvested,
    required this.totalReturns,
    required this.availableBalance,
    required this.propertyCount,
    required this.averageReturn,
    required this.confirmedCount,
    required this.totalCount,
    this.nextDistributionDate,
    this.nextDistributionAmount,
    required this.distribution,
  });
}
