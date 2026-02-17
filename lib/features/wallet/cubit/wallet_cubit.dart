// lib/features/wallet/cubit/wallet_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepository _walletRepo;

  WalletCubit(this._walletRepo) : super(const WalletState());

  Future<void> loadWallet() async {
    emit(state.copyWith(isLoading: true));
    try {
      final wallet = await _walletRepo.getWalletDetails();
      emit(state.copyWith(
        isLoading: false,
        balance: wallet.balance,
        pendingAmount: wallet.pendingAmount,
        recentTransactions: wallet.recentTransactions,
        hasBankAccount: wallet.hasBankAccount,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
