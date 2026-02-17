// ============================================
// KYC Repository - lib/repositories/kyc_repository.dart
// ============================================

import '../core/network/api_client.dart';
import '../core/network/base_repository.dart';
import '../core/network/api_exception.dart';
import '../models/kyc.dart';

class KycRepository extends BaseRepository {
  KycRepository(ApiClient apiClient) : super(apiClient);
  
  /// Get current KYC status and progress
  Future<Result<KycStatus>> getStatus() async {
    return safeApiCall(
      () => dio.get('/kyc/status'),
      (data) => KycStatus.fromJson(data),
    );
  }
  
  /// Submit KYC step data
  /// [step] = 'personal_info' | 'employment' | 'financial' | 'risk_assessment'
  Future<Result<KycStepResult>> submitStep({
    required String step,
    required Map<String, dynamic> data,
  }) async {
    return safeApiCall(
      () => dio.post('/kyc/submit', data: {
        'step': step,
        'data': data,
      }),
      (data) => KycStepResult.fromJson(data),
    );
  }
  
  /// Get risk assessment questions
  Future<Result<List<RiskQuestion>>> getRiskQuestions() async {
    return safeApiCall(
      () => dio.get('/kyc/risk-questions'),
      (data) => (data['questions'] as List)
          .map((q) => RiskQuestion.fromJson(q))
          .toList(),
    );
  }
}

class KycStatus {
  final String status;
  final int currentStep;
  final int totalSteps;
  final double completionPercentage;
  final String? rejectionReason;
  
  KycStatus({required this.status, required this.currentStep, required this.totalSteps, required this.completionPercentage, this.rejectionReason});
  factory KycStatus.fromJson(Map<String, dynamic> json) => KycStatus(
    status: json['status'], currentStep: json['current_step'], totalSteps: json['total_steps'],
    completionPercentage: (json['completion_percentage'] as num).toDouble(), rejectionReason: json['rejection_reason'],
  );
}

class KycStepResult {
  final bool success;
  final String? nextStep;
  final double completionPercentage;
  
  KycStepResult({required this.success, this.nextStep, required this.completionPercentage});
  factory KycStepResult.fromJson(Map<String, dynamic> json) => KycStepResult(
    success: json['success'], nextStep: json['next_step'], completionPercentage: (json['completion_percentage'] as num).toDouble(),
  );
}

class RiskQuestion {
  final String id;
  final String textAr;
  final String textEn;
  final List<Map<String, String>> options;
  
  RiskQuestion({required this.id, required this.textAr, required this.textEn, required this.options});
  factory RiskQuestion.fromJson(Map<String, dynamic> json) => RiskQuestion(
    id: json['id'], textAr: json['text_ar'], textEn: json['text_en'],
    options: (json['options'] as List).map((o) => Map<String, String>.from(o)).toList(),
  );
}
