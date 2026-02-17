import 'package:hseeltech/models/bankaccount.dart';

class WalletModel {
  final double availableBalance; // SAR
  final double totalInvested; // SAR
  final double totalReturns; // SAR
  final BankAccountModel? linkedBank;

  const WalletModel({
    required this.availableBalance,
    required this.totalInvested,
    required this.totalReturns,
    this.linkedBank,
  });
}
