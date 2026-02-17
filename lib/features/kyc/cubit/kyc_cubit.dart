// lib/features/kyc/cubit/kyc_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/kyc_repository.dart';
import 'kyc_state.dart';

class KycCubit extends Cubit<KycState> {
  final KycRepository _kycRepo;

  KycCubit(this._kycRepo) : super(const KycState());

  Future<void> loadStatus() async {
    try {
      final status = await _kycRepo.getStatus();
      emit(state.copyWith(kycStatus: status.status, currentStep: status.completedStep));
    } catch (_) {}
  }

  void updatePersonalInfo({String? occupation, String? income, String? experience}) {
    emit(state.copyWith(
      occupation: occupation ?? state.occupation,
      income: income ?? state.income,
      investmentExperience: experience ?? state.investmentExperience,
    ));
  }

  void setDocument(String type, String path) {
    switch (type) {
      case 'id_front': emit(state.copyWith(idFrontPath: path));
      case 'id_back': emit(state.copyWith(idBackPath: path));
      case 'selfie': emit(state.copyWith(selfiePath: path));
    }
  }

  void nafathCompleted() => emit(state.copyWith(nafathVerified: true));
  void nextStep() => emit(state.copyWith(currentStep: state.currentStep + 1));
  void previousStep() => emit(state.copyWith(currentStep: state.currentStep - 1));

  Future<bool> submitKyc() async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await _kycRepo.submit(
        occupation: state.occupation, income: state.income,
        experience: state.investmentExperience,
        idFront: state.idFrontPath!, idBack: state.idBackPath!, selfie: state.selfiePath!,
      );
      emit(state.copyWith(isSubmitting: false, kycStatus: 'submitted'));
      return true;
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      return false;
    }
  }
}
