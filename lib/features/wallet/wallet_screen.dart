import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

enum WalletView {
  main,
  deposit,
  withdraw,
  detail,
}

class _WalletScreenState extends State<WalletScreen> {
  WalletView _currentView = WalletView.main;
  bool _balanceVisible = true;
  Map<String, dynamic>? _selectedTransaction;

  final List<Map<String, dynamic>> _transactions = [
    {
      "id": "1",
      "type": "deposit",
      "title": "Deposit",
      "subtitle": "VIBAN Transfer - ANB",
      "amount": 25000.0,
      "date": "Feb 10, 2026",
      "time": "2:34 PM",
      "status": "completed",
      "ref": "TXN-2026-001847",
    },
    {
      "id": "2",
      "type": "investment",
      "title": "Investment - Al-Olaya Heights",
      "subtitle": "2 tokens purchased",
      "amount": -20000.0,
      "date": "Feb 8, 2026",
      "time": "11:15 AM",
      "status": "completed",
      "ref": "TXN-2026-001832",
    },
    {
      "id": "3",
      "type": "return",
      "title": "Quarterly Return",
      "subtitle": "Al-Malqa Residences",
      "amount": 1875.0,
      "date": "Feb 1, 2026",
      "time": "9:00 AM",
      "status": "completed",
      "ref": "TXN-2026-001798",
    },
    {
      "id": "5",
      "type": "withdraw",
      "title": "Withdrawal",
      "subtitle": "To Verified IBAN ****7823",
      "amount": -5000.0,
      "date": "Jan 25, 2026",
      "time": "10:08 AM",
      "status": "completed",
      "ref": "TXN-2026-001720",
    },
  ];

  void _navigateTo(WalletView view, {Map<String, dynamic>? transaction}) {
    setState(() {
      _currentView = view;
      _selectedTransaction = transaction;
    });
  }

  Widget _buildMainWallet(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBalanceCard(r, styles, spacing),
          spacing.verticalSpace(24),
          _buildVibanCard(r, styles, spacing),
          spacing.verticalSpace(24),
          _buildQuickActions(r, styles, spacing),
          spacing.verticalSpace(24),
          _buildTransactionHistory(r, styles, spacing),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: r.wp(4)),
      padding: EdgeInsets.all(r.wp(5)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r.radius(16)),
        gradient: const LinearGradient(
          colors: [Color(0xFF1B2A4A), Color(0xFF2E5090), Color(0xFF4A7BC7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available Balance",
                style: styles.bodySmall?.copyWith(color: Colors.white.withOpacity(0.6)),
              ),
              IconButton(
                onPressed: () => setState(() => _balanceVisible = !_balanceVisible),
                icon: Icon(
                  _balanceVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Colors.white.withOpacity(0.7),
                  size: r.icon(20),
                ),
              ),
            ],
          ),
          spacing.verticalSpace(8),
          Text(
            _balanceVisible ? "SAR 8,968.00" : "SAR ••••",
            style: styles.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          spacing.verticalSpace(16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Invested", style: styles.caption?.copyWith(color: Colors.white.withOpacity(0.4))),
                  Text(_balanceVisible ? "30,000" : "••••", style: styles.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.9))),
                ],
              ),
              spacing.horizontalSpace(24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Returns", style: styles.caption?.copyWith(color: Colors.white.withOpacity(0.4))),
                  Text(_balanceVisible ? "3,968" : "••••", style: styles.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.9))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildVibanCard(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: r.wp(4)),
      padding: EdgeInsets.all(r.wp(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(r.radius(16)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: r.wp(10), height: r.wp(10), alignment: Alignment.center, 
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1a1a2e)),
                  child: Text("anb", style: styles.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold))),
              spacing.horizontalSpace(12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Arab National Bank"), Text("Partner Bank")],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: r.wp(2), vertical: r.hp(0.5)),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(r.radius(12)),
                ),
                child: Row(children: [Icon(Icons.shield, size: r.icon(12), color: const Color(0xFF2D6A4F)), spacing.horizontalSpace(4), const Text("Verified")]),
              )
            ],
          ),
          spacing.verticalSpace(16),
          const Divider(),
          spacing.verticalSpace(16),
          _buildInfoRow(r, styles, spacing, "Account Holder", "Razin Fahd Fawzan Al-Fawzan", () => Clipboard.setData(const ClipboardData(text: "Razin Fahd Fawzan Al-Fawzan"))),
          spacing.verticalSpace(16),
          _buildInfoRow(r, styles, spacing, "IBAN Number", "SA07 3010 0971 0000 0513 6065", () => Clipboard.setData(const ClipboardData(text: "SA0730100971000005136065"))),
        ],
      ),
    );
  }

  Widget _buildInfoRow(Responsive r, AppTextStyles styles, AppSpacing spacing, String label, String value, VoidCallback onCopy) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(label, style: styles.caption), Text(value, style: styles.bodyLarge)],
        ),
        IconButton(icon: Icon(Icons.copy, size: r.icon(18)), onPressed: onCopy),
      ],
    );
  }

  Widget _buildQuickActions(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAction(r, styles, spacing, Icons.arrow_downward, "Deposit", () => _navigateTo(WalletView.deposit)),
        _buildAction(r, styles, spacing, Icons.arrow_upward, "Withdraw", () => _navigateTo(WalletView.withdraw)),
      ],
    );
  }

  Widget _buildAction(Responsive r, AppTextStyles styles, AppSpacing spacing, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(radius: r.wp(7), backgroundColor: const Color(0xFF1B2A4A), child: Icon(icon, color: Colors.white, size: r.icon(24))),
          spacing.verticalSpace(8),
          Text(label, style: styles.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Transaction History", style: styles.titleMedium),
          spacing.verticalSpace(16),
          ..._transactions.map((tx) => _buildTransactionTile(r, styles, spacing, tx)),
        ],
      ),
    );
  }

  Widget _buildTransactionTile(Responsive r, AppTextStyles styles, AppSpacing spacing, Map<String, dynamic> tx) {
    final isDeposit = tx["amount"] > 0;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isDeposit ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
        child: Icon(isDeposit ? Icons.arrow_downward : Icons.arrow_upward, color: isDeposit ? const Color(0xFF2D6A4F) : const Color(0xFFC62828), size: r.icon(20)),
      ),
      title: Text(tx["title"], style: styles.bodyLarge),
      subtitle: Text(tx["subtitle"], style: styles.bodySmall),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("${isDeposit ? '+' : ''}${tx["amount"].toStringAsFixed(2)} SAR", style: styles.bodyLarge?.copyWith(color: isDeposit ? const Color(0xFF2D6A4F) : const Color(0xFFC62828))),
          Text(tx["date"], style: styles.bodySmall),
        ],
      ),
      onTap: () => _navigateTo(WalletView.detail, transaction: tx),
    );
  }

  Widget _buildDepositView(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return const Center(child: Text("Deposit View - Not Implemented"));
  }

  Widget _buildWithdrawView(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return const Center(child: Text("Withdraw View - Not Implemented"));
  }

  Widget _buildDetailView(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    return const Center(child: Text("Detail View - Not Implemented"));
  }

  Widget _buildBody(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    switch (_currentView) {
      case WalletView.deposit:
        return _buildDepositView(r, styles, spacing);
      case WalletView.withdraw:
        return _buildWithdrawView(r, styles, spacing);
      case WalletView.detail:
        return _buildDetailView(r, styles, spacing);
      case WalletView.main:
      default:
        return _buildMainWallet(r, styles, spacing);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wallet"),
        backgroundColor: const Color(0xFF1B2A4A),
        leading: _currentView != WalletView.main
            ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => _navigateTo(WalletView.main))
            : null,
      ),
      body: SafeArea(
        child: _buildBody(r, styles, spacing),
      ),
    );
  }
}
