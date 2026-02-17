// lib/features/rewards/cubit/rewards_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/referral_repository.dart';
import 'package:share_plus/share_plus.dart';
import 'rewards_state.dart';

class RewardsCubit extends Cubit<RewardsState> {
  final ReferralRepository _referralRepo;

  RewardsCubit(this._referralRepo) : super(const RewardsState());

  Future<void> loadRewards() async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = await _referralRepo.getRewardsData();
      emit(state.copyWith(
        isLoading: false,
        referralCode: data.code,
        referralLink: data.link,
        totalReferrals: data.totalReferrals,
        totalEarned: data.totalEarned,
        currentTier: data.currentTier,
        referralHistory: data.history,
        tiers: data.tiers,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> shareReferralCode() async {
    await Share.share('Join Hseeltech and earn rewards! Use my code: ${state.referralCode}\n${state.referralLink}');
  }
}
