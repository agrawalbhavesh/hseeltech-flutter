enum KycStatus { pending, inProgress, verified, rejected }

enum RiskProfile { conservative, moderate, aggressive }

class UserModel {
  final String id;
  final String nationalId;
  final String fullNameAr;
  final String fullNameEn;
  final String phone;
  final String? email;
  final String? avatarUrl;
  final KycStatus kycStatus;
  final RiskProfile? riskProfile;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.nationalId,
    required this.fullNameAr,
    required this.fullNameEn,
    required this.phone,
    this.email,
    this.avatarUrl,
    required this.kycStatus,
    this.riskProfile,
    required this.createdAt,
  });
}
