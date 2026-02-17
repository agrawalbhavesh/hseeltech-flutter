// ============================================
// Property Repository - lib/repositories/property_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/property.dart';

class PropertyRepository extends BaseRepository {
  PropertyRepository(ApiClient apiClient) : super(apiClient);
  
  /// List properties with filters and pagination
  Future<Result<PaginatedResponse<Property>>> getProperties({
    String? type,        // residential, commercial, mixed
    String? status,      // active, funded, completed
    String? sort,        // newest, highest_return, most_funded
    int page = 1,
    int limit = 10,
  }) async {
    return safePaginatedCall(
      () => dio.get('/properties', queryParameters: {
        if (type != null) 'type': type,
        if (status != null) 'status': status,
        if (sort != null) 'sort': sort,
        'page': page,
        'limit': limit,
      }),
      (json) => Property.fromJson(json),
      'properties',
    );
  }
  
  /// Get featured properties for Home screen
  Future<Result<List<Property>>> getFeatured() async {
    return safeApiCall(
      () => dio.get('/properties/featured'),
      (data) => (data['properties'] as List)
          .map((p) => Property.fromJson(p))
          .toList(),
    );
  }
  
  /// Get single property detail
  Future<Result<PropertyDetail>> getDetail(String propertyId) async {
    return safeApiCall(
      () => dio.get('/properties/$propertyId'),
      (data) => PropertyDetail.fromJson(data),
    );
  }
}

// PropertyDetail extends Property with additional fields
class PropertyDetail extends Property {
  final String descriptionAr;
  final String descriptionEn;
  final List<String> galleryUrls;
  final double totalValue;
  final int totalTokens;
  final int soldTokens;
  final double expectedYield;
  final int minInvestment;
  final int maxInvestment;
  final DateTime fundingDeadline;
  final DateTime distributionDate;
  final String? documentUrl;
  
  PropertyDetail({
    required super.id, required super.titleAr, required super.titleEn,
    required super.imageUrl, required super.tokenPrice, required super.expectedReturn,
    required super.fundingProgress, required super.type, required super.status,
    required super.locationAr, required super.locationEn,
    required this.descriptionAr, required this.descriptionEn,
    required this.galleryUrls, required this.totalValue,
    required this.totalTokens, required this.soldTokens,
    required this.expectedYield, required this.minInvestment,
    required this.maxInvestment, required this.fundingDeadline,
    required this.distributionDate, this.documentUrl,
  });
  
  factory PropertyDetail.fromJson(Map<String, dynamic> json) => PropertyDetail(
    id: json['id'], titleAr: json['title_ar'], titleEn: json['title_en'],
    imageUrl: json['image_url'], tokenPrice: (json['token_price'] as num).toDouble(),
    expectedReturn: (json['expected_return'] as num).toDouble(),
    fundingProgress: (json['funding_progress'] as num).toDouble(),
    type: json['type'], status: json['status'],
    locationAr: json['location_ar'], locationEn: json['location_en'],
    descriptionAr: json['description_ar'], descriptionEn: json['description_en'],
    galleryUrls: List<String>.from(json['gallery_urls'] ?? []),
    totalValue: (json['total_value'] as num).toDouble(),
    totalTokens: json['total_tokens'], soldTokens: json['sold_tokens'],
    expectedYield: (json['expected_yield'] as num).toDouble(),
    minInvestment: json['min_investment'], maxInvestment: json['max_investment'],
    fundingDeadline: DateTime.parse(json['funding_deadline']),
    distributionDate: DateTime.parse(json['distribution_date']),
    documentUrl: json['document_url'],
  );
}
