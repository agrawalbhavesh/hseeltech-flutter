// lib/features/auth/nafath/cubit/nafath_cubit.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/auth_repository.dart';
import 'nafath_state.dart';

class NafathCubit extends Cubit<NafathState> {
  final AuthRepository _authRepo;
  Timer? _pollTimer;
  Timer? _expiryTimer;

  NafathCubit(this._authRepo) : super(const NafathState.initial());

  Future<void> initiateVerification(String nationalId) async {
    emit(const NafathState.requesting());
    try {
      final result = await _authRepo.initiateNafath(nationalId);
      emit(NafathState.waitingForUser(
        transactionId: result.transactionId,
        randomNumber: result.randomNumber,
        expiresInSeconds: 120,
      ));
      _startPolling(result.transactionId);
      _startExpiryTimer();
    } catch (e) {
      emit(NafathState.error(e.toString()));
    }
  }

  void _startPolling(String transactionId) {
    _pollTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      try {
        final status = await _authRepo.checkNafathStatus(transactionId);
        if (status == 'COMPLETED') {
          _cancelTimers();
          emit(const NafathState.verified());
        } else if (status == 'REJECTED') {
          _cancelTimers();
          emit(const NafathState.rejected());
        }
      } catch (_) {}
    });
  }

  void _startExpiryTimer() {
    _expiryTimer = Timer(const Duration(seconds: 120), () {
      _pollTimer?.cancel();
      emit(const NafathState.expired());
    });
  }

  void _cancelTimers() {
    _pollTimer?.cancel();
    _expiryTimer?.cancel();
  }

  @override
  Future<void> close() {
    _cancelTimers();
    return super.close();
  }
}
