// lib/features/invest/cubit/invest_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/investment_repository.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'invest_state.dart';

class InvestCubit extends Cubit<InvestState> {
  final InvestmentRepository _investRepo;
  final WalletRepository _walletRepo;

  InvestCubit(this._investRepo, this._walletRepo, {required property})
    : super(InvestState(property: property));

  Future<void> loadWalletBalance() async {
    final balance = await _walletRepo.getBalance();
    emit(state.copyWith(walletBalance: balance));
  }

  void updateAmount(double amount) {
    final tokenPrice = state.property.tokenPrice;  // v3.0: renamed from sharePrice
    final tokens = (amount / tokenPrice).floor();
    String? error;
    if (amount < state.property.minInvestment) error = 'Minimum investment is ${state.property.minInvestment} SAR';
    if (amount > state.walletBalance) error = 'Insufficient wallet balance';
    if (tokens > state.property.availableTokens) error = 'Not enough tokens available';
    emit(state.copyWith(amount: amount, tokens: tokens, amountError: error));
  }

  void nextStep() => emit(state.copyWith(currentStep: state.currentStep + 1));
  void previousStep() => emit(state.copyWith(currentStep: state.currentStep - 1));

  Future<bool> confirmInvestment() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _investRepo.invest(
        propertyId: state.property.id,
        amount: state.amount,
        tokens: state.tokens,
      );
      emit(state.copyWith(isLoading: false));
      return true;
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      return false;
    }
  }
}
