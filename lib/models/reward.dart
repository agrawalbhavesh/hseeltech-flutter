class RewardsModel {
  final RewardTier currentTier;
  final double earnings; // SAR
  final int referralCount;
  final String referralCode;
  final String referralLink;
  final double progressToNextTier; // 0.0 to 1.0

  const RewardsModel({
    required this.currentTier,
    required this.earnings,
    required this.referralCount,
    required this.referralCode,
    required this.referralLink,
    required this.progressToNextTier,
  });
}

enum RewardTier { alIitlaq, alRaed, alMustathmer, alShareek }
