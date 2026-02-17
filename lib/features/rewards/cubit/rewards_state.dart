// lib/features/rewards/cubit/rewards_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/reward.dart';
part 'rewards_state.freezed.dart';

@freezed
class RewardsState with _$RewardsState {
  const factory RewardsState({
    @Default(true) bool isLoading,
    @Default('') String referralCode,
    @Default('') String referralLink,
    @Default(0) int totalReferrals,
    @Default(0.0) double totalEarned,
    @Default('bronze') String currentTier,
    @Default([]) List<Referral> referralHistory,
    @Default([]) List<RewardTier> tiers,
    String? errorMessage,
  }) = _RewardsState;
}
