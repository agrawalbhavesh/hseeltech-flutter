// lib/features/wallet/withdraw/cubit/withdraw_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  final WalletRepository _walletRepo;

  WithdrawCubit(this._walletRepo) : super(const WithdrawState());

  Future<void> loadBalance() async {
    final balance = await _walletRepo.getBalance();
    emit(state.copyWith(availableBalance: balance));
  }

  void updateAmount(double amount) {
    String? error;
    if (amount > state.availableBalance) error = 'Exceeds available balance';
    emit(state.copyWith(amount: amount, errorMessage: error));
  }

  Future<bool> processWithdraw() async {
    emit(state.copyWith(isProcessing: true, errorMessage: null));
    try {
      await _walletRepo.withdraw(amount: state.amount);
      emit(state.copyWith(isProcessing: false, isSuccess: true));
      return true;
    } catch (e) {
      emit(state.copyWith(isProcessing: false, errorMessage: e.toString()));
      return false;
    }
  }
}
