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
  final double tokenPrice; // SAR per token
  final int totalTokens;
  final int soldTokens;
  final double expectedAnnualReturn; // percentage
  final double netYield; // percentage
  final String distributionFrequency; // "quarterly", "monthly", etc.
  final double totalFundingTarget; // SAR
  final double currentFunding; // SAR

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
