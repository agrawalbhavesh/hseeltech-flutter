// lib/features/profile/cubit/profile_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/user.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(true) bool isLoading,
    User? user,
    @Default('') String kycStatus,
    @Default(0) int totalInvestments,
    @Default(0.0) double totalInvested,
    String? errorMessage,
  }) = _ProfileState;
}
