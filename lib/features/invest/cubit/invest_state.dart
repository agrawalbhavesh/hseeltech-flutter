// lib/features/invest/cubit/invest_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/property.dart';
part 'invest_state.freezed.dart';

@freezed
class InvestState with _$InvestState {
  const factory InvestState({
    required Property property,
    @Default(0.0) double amount,
    @Default(0) int tokens,  // v3.0: renamed from shares
    @Default(0.0) double walletBalance,
    @Default(false) bool isLoading,
    @Default(0) int currentStep, // 0=amount, 1=summary, 2=confirm
    String? errorMessage,
    String? amountError,
  }) = _InvestState;
}
