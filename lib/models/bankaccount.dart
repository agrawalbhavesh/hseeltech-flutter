class BankAccountModel {
  final String id;
  final String userId;
  final String bankNameAr;
  final String bankNameEn;
  final String bankCode; // e.g., "anb", "alrajhi"
  final String iban; // SA + 22 digits
  final String beneficiaryName;
  final String? accountNumber;
  final bool isVerified;
  final bool isPrimary;
  final DateTime createdAt;

  const BankAccountModel({
    required this.id,
    required this.userId,
    required this.bankNameAr,
    required this.bankNameEn,
    required this.bankCode,
    required this.iban,
    required this.beneficiaryName,
    this.accountNumber,
    required this.isVerified,
    required this.isPrimary,
    required this.createdAt,
  });
}
