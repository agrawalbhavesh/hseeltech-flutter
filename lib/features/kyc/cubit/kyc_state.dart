// lib/features/kyc/cubit/kyc_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'kyc_state.freezed.dart';

@freezed
class KycState with _$KycState {
  const factory KycState({
    @Default(0) int currentStep, // 0=personal, 1=documents, 2=nafath, 3=review
    @Default(4) int totalSteps,
    @Default(false) bool isSubmitting,
    // Personal info
    @Default('') String occupation,
    @Default('') String income,
    @Default('') String investmentExperience,
    // Documents
    @Default(null) String? idFrontPath,
    @Default(null) String? idBackPath,
    @Default(null) String? selfiePath,
    // Nafath
    @Default(false) bool nafathVerified,
    // Status
    @Default('pending') String kycStatus, // pending, submitted, approved, rejected
    String? errorMessage,
  }) = _KycState;
}
