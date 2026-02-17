// lib/features/wallet/withdraw/cubit/withdraw_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'withdraw_state.freezed.dart';

@freezed
class WithdrawState with _$WithdrawState {
  const factory WithdrawState({
    @Default(0.0) double amount,
    @Default(0.0) double availableBalance,
    @Default(false) bool isProcessing,
    @Default(false) bool isSuccess,
    String? bankAccountId,
    String? errorMessage,
  }) = _WithdrawState;
}
