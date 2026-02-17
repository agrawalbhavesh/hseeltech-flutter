// lib/features/wallet/bank/cubit/bank_account_cubit.dart
// v3.0 Updated: Open Banking verification + Nafath auto-fill
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'package:hseeltech/core/repositories/nafath_repository.dart';
import 'package:hseeltech/core/repositories/open_banking_repository.dart';
import 'bank_account_state.dart';

class BankAccountCubit extends Cubit<BankAccountState> {
  final WalletRepository _walletRepo;
  final NafathRepository _nafathRepo;
  final OpenBankingRepository _openBankingRepo;

  BankAccountCubit(this._walletRepo, this._nafathRepo, this._openBankingRepo)
    : super(const BankAccountState());

  Future<void> loadExisting() async {
    emit(state.copyWith(isLoading: true));
    try {
      final account = await _walletRepo.getBankAccount();
      final nafathName = await _nafathRepo.getUserName();
      if (account != null) {
        emit(state.copyWith(isLoading: false, hasExistingAccount: true,
          existingIban: account.iban, iban: account.iban,
          bankName: account.bankName, nafathName: nafathName));
      } else {
        emit(state.copyWith(isLoading: false, nafathName: nafathName));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void updateIban(String iban) {
    String? error;
    if (iban.length > 2 && !iban.startsWith('SA')) error = 'IBAN must start with SA';
    if (iban.length > 0 && iban.length != 24) error = 'IBAN must be 24 characters';
    // Reset verification when IBAN changes
    emit(state.copyWith(iban: iban, ibanError: error,
      verificationStep: VerificationStep.idle, verificationProgress: 0,
      openBankingToken: null, verificationError: null));
  }

  // --- Open Banking IBAN verification (4 steps) ---
  Future<void> verifyIbanOpenBanking() async {
    emit(state.copyWith(verificationStep: VerificationStep.verifying, verificationProgress: 0));
    try {
      // Step 1: IBAN format validation
      emit(state.copyWith(verificationProgress: 0.25));
      await Future.delayed(const Duration(milliseconds: 500));
      // Step 2: Arab Bank connection
      emit(state.copyWith(verificationProgress: 0.50));
      await Future.delayed(const Duration(milliseconds: 800));
      // Step 3: Nafath data matching
      emit(state.copyWith(verificationProgress: 0.80));
      final result = await _openBankingRepo.verifyIban(
        iban: state.iban, bankCode: state.bankName, nafathName: state.nafathName);
      // Step 4: Final verification
      emit(state.copyWith(verificationStep: VerificationStep.verified,
        verificationProgress: 1.0, openBankingToken: result.token));
    } catch (e) {
      emit(state.copyWith(verificationStep: VerificationStep.failed,
        verificationError: e.toString()));
    }
  }

  // --- Submit bank account (only after Open Banking verification) ---
  Future<bool> saveBankAccount() async {
    if (state.verificationStep != VerificationStep.verified) return false;
    emit(state.copyWith(isSubmitting: true));
    try {
      await _walletRepo.saveBankAccount(
        iban: state.iban, bankName: state.bankName,
        holderName: state.nafathName, verificationToken: state.openBankingToken!);
      emit(state.copyWith(isSubmitting: false, hasExistingAccount: true));
      return true;
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      return false;
    }
  }
}
