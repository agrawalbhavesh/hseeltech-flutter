// lib/features/auth/register/cubit/register_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepo;

  RegisterCubit(this._authRepo) : super(const RegisterState());

  void updateField(String field, String value) {
    switch (field) {
      case 'fullName': emit(state.copyWith(fullName: value, fieldErrors: {...state.fieldErrors}..remove('fullName')));
      case 'email': emit(state.copyWith(email: value, fieldErrors: {...state.fieldErrors}..remove('email')));
      case 'phone': emit(state.copyWith(phone: value, fieldErrors: {...state.fieldErrors}..remove('phone')));
      case 'nationalId': emit(state.copyWith(nationalId: value, fieldErrors: {...state.fieldErrors}..remove('nationalId')));
    }
  }

  void toggleTerms(bool value) => emit(state.copyWith(termsAccepted: value));
  void nextStep() => emit(state.copyWith(currentStep: state.currentStep + 1, errorMessage: null));
  void previousStep() => emit(state.copyWith(currentStep: state.currentStep - 1));

  Future<void> sendOtp() async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      await _authRepo.sendOtp(state.phone);
      emit(state.copyWith(isSubmitting: false, otpSent: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }

  Future<bool> verifyOtpAndRegister(String otp) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      await _authRepo.register(
        fullName: state.fullName,
        email: state.email,
        phone: state.phone,
        nationalId: state.nationalId,
        otp: otp,
      );
      emit(state.copyWith(isSubmitting: false));
      return true;
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      return false;
    }
  }
}
