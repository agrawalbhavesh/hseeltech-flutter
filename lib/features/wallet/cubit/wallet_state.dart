// lib/features/wallet/cubit/wallet_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/wallet.dart';
part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(true) bool isLoading,
    @Default(0.0) double balance,
    @Default(0.0) double pendingAmount,
    @Default([]) List<Transaction> recentTransactions,
    @Default(false) bool hasBankAccount,
    String? errorMessage,
  }) = _WalletState;
}
