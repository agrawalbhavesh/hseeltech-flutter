// lib/features/wallet/transactions/cubit/transactions_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/wallet.dart';
part 'transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default(true) bool isLoading,
    @Default([]) List<Transaction> transactions,
    @Default('all') String filter, // all, deposit, withdraw, investment, return
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    String? errorMessage,
  }) = _TransactionsState;
}
