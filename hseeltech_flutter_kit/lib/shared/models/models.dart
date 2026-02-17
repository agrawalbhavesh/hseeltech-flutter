/// Hseeltech Data Models
/// These models define the data structures used throughout the app.
/// Adapt serialization (fromJson/toJson) to match your actual API responses.

// ═══════════════════════════════════════
// USER
// ═══════════════════════════════════════

class UserModel {
  final String id;
  final String nationalId;
  final String fullNameAr;
  final String fullNameEn;
  final String phone;
  final String? email;
  final String? avatarUrl;
  final KycStatus kycStatus;
  final RiskProfile? riskProfile;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.nationalId,
    required this.fullNameAr,
    required this.fullNameEn,
    required this.phone,
    this.email,
    this.avatarUrl,
    required this.kycStatus,
    this.riskProfile,
    required this.createdAt,
  });
}

enum KycStatus { pending, inProgress, verified, rejected }
enum RiskProfile { conservative, moderate, aggressive }

// ═══════════════════════════════════════
// PROPERTY / OPPORTUNITY
// ═══════════════════════════════════════

class PropertyModel {
  final String id;
  final String titleAr;
  final String titleEn;
  final PropertyType type;
  final String locationAr;
  final String locationEn;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;
  final String descriptionAr;
  final String descriptionEn;

  // Financial
  final double tokenPrice;        // SAR per token
  final int totalTokens;
  final int soldTokens;
  final double expectedAnnualReturn; // percentage
  final double netYield;            // percentage
  final String distributionFrequency; // "quarterly", "monthly", etc.
  final double totalFundingTarget;  // SAR
  final double currentFunding;      // SAR

  // Property specs
  final int bedrooms;
  final int bathrooms;
  final double areaSqm;

  // Status
  final PropertyStatus status;
  final DateTime? fundingDeadline;
  final DateTime createdAt;

  const PropertyModel({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.type,
    required this.locationAr,
    required this.locationEn,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.tokenPrice,
    required this.totalTokens,
    required this.soldTokens,
    required this.expectedAnnualReturn,
    required this.netYield,
    required this.distributionFrequency,
    required this.totalFundingTarget,
    required this.currentFunding,
    required this.bedrooms,
    required this.bathrooms,
    required this.areaSqm,
    required this.status,
    this.fundingDeadline,
    required this.createdAt,
  });

  double get fundingPercentage => (currentFunding / totalFundingTarget) * 100;
  int get availableTokens => totalTokens - soldTokens;
}

enum PropertyType { residential, commercial, retail, hospitality }
enum PropertyStatus { available, funded, comingSoon, completed }

// ═══════════════════════════════════════
// INVESTMENT
// ═══════════════════════════════════════

class InvestmentModel {
  final String id;
  final String userId;
  final String propertyId;
  final PropertyModel? property; // populated from API
  final int tokenCount;
  final double totalAmount;       // SAR
  final double currentValue;      // SAR (with returns)
  final double totalReturns;      // SAR
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

// ═══════════════════════════════════════
// TRANSACTION
// ═══════════════════════════════════════

class TransactionModel {
  final String id;
  final String userId;
  final TransactionType type;
  final double amount;            // SAR
  final TransactionStatus status;
  final String? method;           // "bank_transfer", "wallet", etc.
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

// ═══════════════════════════════════════
// BANK ACCOUNT
// ═══════════════════════════════════════

class BankAccountModel {
  final String id;
  final String userId;
  final String bankNameAr;
  final String bankNameEn;
  final String bankCode;          // e.g., "anb", "alrajhi"
  final String iban;              // SA + 22 digits
  final String beneficiaryName;
  final String? accountNumber;
  final bool isVerified;
  final bool isPrimary;
  final DateTime createdAt;

  const BankAccountModel({
    required this.id,
    required this.userId,
    required this.bankNameAr,
    required this.bankNameEn,
    required this.bankCode,
    required this.iban,
    required this.beneficiaryName,
    this.accountNumber,
    required this.isVerified,
    required this.isPrimary,
    required this.createdAt,
  });
}

// ═══════════════════════════════════════
// WALLET
// ═══════════════════════════════════════

class WalletModel {
  final double availableBalance;  // SAR
  final double totalInvested;     // SAR
  final double totalReturns;      // SAR
  final BankAccountModel? linkedBank;

  const WalletModel({
    required this.availableBalance,
    required this.totalInvested,
    required this.totalReturns,
    this.linkedBank,
  });
}

// ═══════════════════════════════════════
// REWARDS
// ═══════════════════════════════════════

class RewardsModel {
  final RewardTier currentTier;
  final double earnings;          // SAR
  final int referralCount;
  final String referralCode;
  final String referralLink;
  final double progressToNextTier; // 0.0 to 1.0

  const RewardsModel({
    required this.currentTier,
    required this.earnings,
    required this.referralCount,
    required this.referralCode,
    required this.referralLink,
    required this.progressToNextTier,
  });
}

enum RewardTier { alIitlaq, alRaed, alMustathmer, alShareek }

// ═══════════════════════════════════════
// NOTIFICATION
// ═══════════════════════════════════════

class NotificationModel {
  final String id;
  final String titleAr;
  final String titleEn;
  final String bodyAr;
  final String bodyEn;
  final NotificationType type;
  final bool isRead;
  final String? actionRoute;      // deep link route
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

// ═══════════════════════════════════════
// PORTFOLIO SUMMARY
// ═══════════════════════════════════════

class PortfolioSummary {
  final double totalValue;        // SAR (invested + returns)
  final double totalInvested;     // SAR
  final double totalReturns;      // SAR
  final double availableBalance;  // SAR
  final int propertyCount;
  final double averageReturn;     // percentage
  final int confirmedCount;       // verified investments
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
