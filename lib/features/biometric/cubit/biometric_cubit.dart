// lib/features/auth/biometric/cubit/biometric_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  final LocalAuthentication _localAuth;

  BiometricCubit(this._localAuth) : super(const BiometricState.initial());

  Future<void> checkAvailability() async {
    emit(const BiometricState.checking());
    final canAuth = await _localAuth.canCheckBiometrics;
    if (!canAuth) { emit(const BiometricState.notAvailable()); return; }
    final types = await _localAuth.getAvailableBiometrics();
    emit(BiometricState.available(types: types.map((t) => t.name).toList()));
  }

  Future<void> authenticate() async {
    emit(const BiometricState.authenticating());
    try {
      final success = await _localAuth.authenticate(
        localizedReason: 'Verify your identity',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      emit(success ? const BiometricState.authenticated() : const BiometricState.failed('Authentication cancelled'));
    } catch (e) {
      emit(BiometricState.failed(e.toString()));
    }
  }
}
