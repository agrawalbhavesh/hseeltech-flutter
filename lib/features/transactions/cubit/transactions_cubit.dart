// lib/features/wallet/transactions/cubit/transactions_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final WalletRepository _walletRepo;

  TransactionsCubit(this._walletRepo) : super(const TransactionsState());

  Future<void> loadTransactions({bool refresh = false}) async {
    if (refresh) emit(state.copyWith(currentPage: 1, isLoading: true));
    try {
      final result = await _walletRepo.getTransactions(
        page: state.currentPage, type: state.filter == 'all' ? null : state.filter,
      );
      emit(state.copyWith(
        isLoading: false,
        transactions: refresh ? result.items : [...state.transactions, ...result.items],
        hasMore: result.hasMore,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void updateFilter(String filter) { emit(state.copyWith(filter: filter)); loadTransactions(refresh: true); }
  void loadMore() { emit(state.copyWith(currentPage: state.currentPage + 1)); loadTransactions(); }
}
