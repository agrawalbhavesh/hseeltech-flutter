// lib/features/wallet/bank/cubit/bank_account_state.dart
// v3.0 Updated: Added Open Banking verification state + Nafath auto-fill
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bank_account_state.freezed.dart';

enum VerificationStep { idle, verifying, verified, failed }

@freezed
class BankAccountState with _$BankAccountState {
  const factory BankAccountState({
    @Default(true) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default('') String iban,
    @Default('') String bankName,
    @Default('') String nafathName, // Auto-filled from Nafath (read-only)
    @Default(false) bool hasExistingAccount,
    @Default(VerificationStep.idle) VerificationStep verificationStep,
    @Default(0.0) double verificationProgress,
    String? openBankingToken, // Token from successful verification
    String? existingIban,
    String? errorMessage,
    String? ibanError,
    String? verificationError,
  }) = _BankAccountState;
}
