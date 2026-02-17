// lib/features/account/cubit/delete_account_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.confirming() = _Confirming;
  const factory DeleteAccountState.verifyingPin() = _VerifyingPin;
  const factory DeleteAccountState.pinError(String message) = _PinError;
  const factory DeleteAccountState.deleting() = _Deleting;
  const factory DeleteAccountState.deleted() = _Deleted;
  const factory DeleteAccountState.error(String message) = _Error;
}
