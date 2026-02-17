// lib/features/auth/nafath/cubit/nafath_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'nafath_state.freezed.dart';

@freezed
class NafathState with _$NafathState {
  const factory NafathState.initial() = _Initial;
  const factory NafathState.requesting() = _Requesting;
  const factory NafathState.waitingForUser({
    required String transactionId,
    required String randomNumber,
    required int expiresInSeconds,
  }) = _WaitingForUser;
  const factory NafathState.polling() = _Polling;
  const factory NafathState.verified() = _Verified;
  const factory NafathState.expired() = _Expired;
  const factory NafathState.rejected() = _Rejected;
  const factory NafathState.error(String message) = _Error;
}
