// lib/features/auth/register/cubit/register_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(0) int currentStep,
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String nationalId,
    @Default(false) bool termsAccepted,
    @Default(false) bool isSubmitting,
    @Default(false) bool otpSent,
    @Default('') String otpCode,
    String? errorMessage,
    @Default({}) Map<String, String> fieldErrors,
  }) = _RegisterState;
}
