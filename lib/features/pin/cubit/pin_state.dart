// lib/features/auth/pin/cubit/pin_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pin_state.freezed.dart';

@freezed
class PinState with _$PinState {
  const factory PinState.initial({@Default(false) bool isSetupMode}) = _Initial;
  const factory PinState.enterPin({required int enteredLength, @Default(false) bool isConfirm}) = _EnterPin;
  const factory PinState.verifying() = _Verifying;
  const factory PinState.success() = _Success;
  const factory PinState.error(String message, {required int attemptsLeft}) = _Error;
  const factory PinState.locked({required DateTime unlockAt}) = _Locked;
}
