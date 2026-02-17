// lib/features/wallet/deposit/cubit/deposit_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'deposit_state.dart';

class DepositCubit extends Cubit<DepositState> {
  final WalletRepository _walletRepo;

  DepositCubit(this._walletRepo) : super(const DepositState());

  void updateAmount(double amount) => emit(state.copyWith(amount: amount, errorMessage: null));
  void updateMethod(String method) => emit(state.copyWith(method: method));

  Future<bool> processDeposit() async {
    if (state.amount <= 0) { emit(state.copyWith(errorMessage: 'Enter a valid amount')); return false; }
    emit(state.copyWith(isProcessing: true, errorMessage: null));
    try {
      final ref = await _walletRepo.deposit(amount: state.amount, method: state.method);
      emit(state.copyWith(isProcessing: false, isSuccess: true, referenceNumber: ref));
      return true;
    } catch (e) {
      emit(state.copyWith(isProcessing: false, errorMessage: e.toString()));
      return false;
    }
  }
}
