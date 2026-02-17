// lib/features/auth/biometric/cubit/biometric_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'biometric_state.freezed.dart';

@freezed
class BiometricState with _$BiometricState {
  const factory BiometricState.initial() = _Initial;
  const factory BiometricState.checking() = _Checking;
  const factory BiometricState.available({required List<String> types}) = _Available;
  const factory BiometricState.notAvailable() = _NotAvailable;
  const factory BiometricState.authenticating() = _Authenticating;
  const factory BiometricState.authenticated() = _Authenticated;
  const factory BiometricState.failed(String reason) = _Failed;
}
