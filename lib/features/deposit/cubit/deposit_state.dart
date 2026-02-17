// lib/features/wallet/deposit/cubit/deposit_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'deposit_state.freezed.dart';

@freezed
class DepositState with _$DepositState {
  const factory DepositState({
    @Default(0.0) double amount,
    @Default('bank_transfer') String method, // bank_transfer, mada, apple_pay
    @Default(false) bool isProcessing,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? referenceNumber,
  }) = _DepositState;
}
