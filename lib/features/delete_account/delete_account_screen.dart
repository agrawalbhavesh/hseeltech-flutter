// ═══════════════════════════════════════════════════════════════
// delete_account_screen.dart — 3-Step Account Deletion Flow
// ═══════════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});
  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  int _currentStep = 0; // 0=Confirm, 1=PIN, 2=Success
  bool _agreed = false;
  final List<String> _pin = ['', '', '', ''];
  int _pinIndex = 0;
  bool _pinError = false;

  static const _navy = Color(0xFF1B2A4A);
  static const _blue = Color(0xFF2E5090);
  static const _red = Color(0xFFEF4444);
  static const _redLight = Color(0xFFFEF2F2);
  static const _green = Color(0xFF10B981);
  static const _gray = Color(0xFF6B7280);
  static const _grayLight = Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: _navy),
          onPressed: () {
            if (_currentStep > 0 && _currentStep < 2) {
              setState(() => _currentStep--);
            } else {
              context.pop();
            }
          },
        ),
        title: Text(
          l10n.deleteAccount,
          style: const TextStyle(
            color: _navy, fontSize: 18, fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildStepIndicator(l10n),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _currentStep == 0
                  ? _buildConfirmStep(l10n)
                  : _currentStep == 1
                      ? _buildPinStep(l10n)
                      : _buildSuccessStep(l10n),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(AppLocalizations l10n) {
    final labels = [l10n.confirm, l10n.verify, l10n.done];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        children: List.generate(3, (i) {
          final isActive = i <= _currentStep;
          final isCompleted = i < _currentStep;
          return Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: isCompleted
                          ? _green
                          : isActive ? _blue : _grayLight,
                      child: isCompleted
                          ? const Icon(Icons.check, size: 14, color: Colors.white)
                          : Text(
                              '\${i + 1}',
                              style: TextStyle(
                                color: isActive ? Colors.white : _gray,
                                fontSize: 12, fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                    const SizedBox(height: 4),
                    Text(labels[i],
                      style: TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500,
                        color: isActive ? _navy : _gray,
                      ),
                    ),
                  ],
                ),
                if (i < 2)
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      color: i < _currentStep ? _green : _grayLight,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildConfirmStep(AppLocalizations l10n) {
    final warnings = [
      {'icon': Icons.trending_down, 'title': l10n.investmentsLost, 'desc': l10n.investmentsLostDesc},
      {'icon': Icons.account_balance_wallet, 'title': l10n.walletForfeited, 'desc': l10n.walletForfeitedDesc},
      {'icon': Icons.delete_forever, 'title': l10n.dataDeleted, 'desc': l10n.dataDeletedDesc},
      {'icon': Icons.warning_amber, 'title': l10n.irreversible, 'desc': l10n.irreversibleDesc},
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.deleteWarningTitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: _navy)),
          const SizedBox(height: 8),
          Text(l10n.deleteWarningSubtitle,
              style: const TextStyle(fontSize: 13, color: _gray)),
          const SizedBox(height: 20),
          ...warnings.map((w) => _warningCard(
            w['icon'] as IconData, w['title'] as String, w['desc'] as String,
          )),
          const SizedBox(height: 20),
          Row(children: [
            Checkbox(value: _agreed, onChanged: (v) => setState(() => _agreed = v ?? false), activeColor: _red),
            Expanded(child: Text(l10n.agreeToDelete,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: _navy))),
          ]),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, height: 52,
            child: ElevatedButton(
              onPressed: _agreed ? () => setState(() => _currentStep = 1) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _red, disabledBackgroundColor: _grayLight,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(l10n.continueButton,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, height: 52,
            child: OutlinedButton(
              onPressed: () => context.pop(),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: _blue),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(l10n.cancel,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _blue)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _warningCard(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: _redLight, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Container(width: 40, height: 40,
          decoration: BoxDecoration(color: _red.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: _red, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _navy)),
          const SizedBox(height: 2),
          Text(desc, style: const TextStyle(fontSize: 11, color: _gray)),
        ])),
      ]),
    );
  }

  Widget _buildPinStep(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(children: [
        const SizedBox(height: 40),
        const Icon(Icons.lock_outline, size: 48, color: _blue),
        const SizedBox(height: 16),
        Text(l10n.enterPin, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: _navy)),
        const SizedBox(height: 8),
        Text(l10n.enterPinDesc, style: const TextStyle(fontSize: 13, color: _gray), textAlign: TextAlign.center),
        const SizedBox(height: 32),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (i) => Container(
            width: 56, height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: _grayLight, borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _pinError ? _red : (i == _pinIndex ? _blue : Colors.transparent), width: 2),
            ),
            child: Center(child: _pin[i].isNotEmpty
                ? Container(width: 14, height: 14, decoration: const BoxDecoration(color: _navy, shape: BoxShape.circle))
                : null),
          ))),
        if (_pinError) ...[
          const SizedBox(height: 12),
          Text(l10n.wrongPin, style: const TextStyle(fontSize: 12, color: _red)),
        ],
        const SizedBox(height: 32),
        Wrap(spacing: 24, runSpacing: 16, alignment: WrapAlignment.center, children: [
          for (var n = 1; n <= 9; n++) _keypadButton('\$n'),
          const SizedBox(width: 64),
          _keypadButton('0'),
          _backspaceButton(),
        ]),
      ]),
    );
  }

  Widget _keypadButton(String digit) {
    return InkWell(
      onTap: () {
        if (_pinIndex < 4) {
          setState(() {
            _pin[_pinIndex] = digit;
            _pinIndex++;
            _pinError = false;
            if (_pinIndex == 4) {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (_pin.join() == '1234') {
                  setState(() => _currentStep = 2);
                } else {
                  setState(() { _pinError = true; _pin.fillRange(0, 4, ''); _pinIndex = 0; });
                }
              });
            }
          });
        }
      },
      borderRadius: BorderRadius.circular(32),
      child: Container(width: 64, height: 64,
        decoration: BoxDecoration(color: _grayLight, shape: BoxShape.circle),
        child: Center(child: Text(digit, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: _navy))),
      ),
    );
  }

  Widget _backspaceButton() {
    return InkWell(
      onTap: () { if (_pinIndex > 0) setState(() { _pinIndex--; _pin[_pinIndex] = ''; _pinError = false; }); },
      borderRadius: BorderRadius.circular(32),
      child: const SizedBox(width: 64, height: 64, child: Center(child: Icon(Icons.backspace_outlined, color: _navy))),
    );
  }

  Widget _buildSuccessStep(AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 80, height: 80,
            decoration: const BoxDecoration(color: _green, shape: BoxShape.circle),
            child: const Icon(Icons.check, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(l10n.accountDeleted,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: _navy)),
          const SizedBox(height: 12),
          Text(l10n.accountDeletedDesc,
              style: const TextStyle(fontSize: 14, color: _gray), textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(l10n.pendingWithdrawalsNote,
              style: const TextStyle(fontSize: 12, color: _gray), textAlign: TextAlign.center),
          const SizedBox(height: 32),
          SizedBox(width: double.infinity, height: 52,
            child: ElevatedButton(
              onPressed: () => context.go('/welcome'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(l10n.backToLogin,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
            ),
          ),
        ]),
      ),
    );
  }
}
