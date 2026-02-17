// lib/features/auth/pin/cubit/pin_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/auth_repository.dart';
import 'package:hseeltech/core/services/storage_service.dart';
import 'pin_state.dart';

class PinCubit extends Cubit<PinState> {
  final AuthRepository _authRepo;
  final StorageService _storage;
  String _firstPin = '';
  int _attempts = 0;
  static const _maxAttempts = 5;

  PinCubit(this._authRepo, this._storage) : super(const PinState.initial());

  void startSetup() => emit(const PinState.enterPin(enteredLength: 0, isConfirm: false));
  void startVerification() => emit(const PinState.enterPin(enteredLength: 0));

  void onDigitEntered(int length) {
    emit(PinState.enterPin(enteredLength: length, isConfirm: _firstPin.isNotEmpty));
  }

  Future<void> submitPin(String pin) async {
    if (_firstPin.isEmpty && state is _Initial) {
      // Setup mode: first entry
      _firstPin = pin;
      emit(const PinState.enterPin(enteredLength: 0, isConfirm: true));
      return;
    }
    if (_firstPin.isNotEmpty && _firstPin != pin) {
      // Confirm mismatch
      _firstPin = '';
      emit(PinState.error('PINs do not match', attemptsLeft: _maxAttempts));
      return;
    }
    emit(const PinState.verifying());
    try {
      if (_firstPin.isNotEmpty) {
        await _authRepo.setupPin(pin);
      } else {
        await _authRepo.verifyPin(pin);
      }
      emit(const PinState.success());
    } catch (e) {
      _attempts++;
      if (_attempts >= _maxAttempts) {
        final unlockAt = DateTime.now().add(const Duration(minutes: 30));
        emit(PinState.locked(unlockAt: unlockAt));
      } else {
        emit(PinState.error(e.toString(), attemptsLeft: _maxAttempts - _attempts));
      }
    }
  }
}
