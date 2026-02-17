import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);
  @override _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  String _activeCat = 'general';
  int? _openIdx = 0;
  String _search = '';

  static const _cats = [
    {'id': 'general', 'title': 'General', 'icon': Icons.help_outline},
    {'id': 'investment', 'title': 'Investment', 'icon': Icons.trending_up},
    {'id': 'property', 'title': 'Properties', 'icon': Icons.apartment},
    {'id': 'security', 'title': 'Security', 'icon': Icons.shield_outlined},
    {'id': 'wallet', 'title': 'Wallet', 'icon': Icons.account_balance_wallet_outlined},
    {'id': 'referral', 'title': 'Referrals', 'icon': Icons.people_outline},
  ];

  static const Map<String, List<Map<String, String>>> _data = {
    'general': [
      {'q': 'What is Hseeltech?', 'a': 'Fractional real estate investment platform under REGA Sandbox.'},
      {'q': 'Is Hseeltech regulated?', 'a': 'Yes, within REGA Regulatory Sandbox.'},
      {'q': 'Who can invest?', 'a': 'Saudi nationals/residents 18+ with valid ID.'},
    ],
    'investment': [
      {'q': 'Minimum investment?', 'a': 'Typically from SAR 500 per share.'},
      {'q': 'Returns distribution?', 'a': 'Quarterly rental income by ownership %.'},
      {'q': 'Can I sell tokens?', 'a': 'Secondary market under development.'},
      {'q': 'Expected returns?', 'a': '7-12% annually (estimated).'},
    ],
    'property': [
      {'q': 'Property selection?', 'a': 'Due diligence: valuation, market, legal.'},
      {'q': 'Property management?', 'a': 'Professional management companies.'},
    ],
    'security': [
      {'q': 'Data protection?', 'a': 'PDPL compliant. Encrypted. Nafath + MFA.'},
      {'q': 'KYC process?', 'a': '5 steps: personal, financial, experience, risk, docs.'},
    ],
    'wallet': [
      {'q': 'Fund wallet?', 'a': 'Bank transfer, Apple Pay, mada.'},
      {'q': 'Withdraw?', 'a': 'To bank account, 2-3 business days.'},
    ],
    'referral': [
      {'q': 'Referral program?', 'a': 'Both get SAR 150 on first investment.'},
      {'q': 'Reward tiers?', 'a': '4 tiers: Launch, Pioneer, Expert, Elite.'},
    ],
   };

  List<Map<String, String>> get _filtered {
    if (_search.isNotEmpty) return _data.values.expand((e) => e)
    return _data[_activeCat] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    const navy = Color(0xFF1B2A4A);
    const blue = Color(0xFF2E5090);
    const bluePale = Color(0xFFEDF2F9);
    const blueGhost = Color(0xFFF5F8FC);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        // Header
        Container(
          padding: EdgeInsets.fromLTRB(r.wp(5), r.hp(7), r.wp(5), r.hp(2.5)),
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [navy, blue])),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.chevron_left, color: Colors.white)),
              Text('FAQ', style: TextStyle(fontSize: r.sp(18), fontWeight: FontWeight.w800, color: Colors.white)),
              SizedBox(width: r.wp(9)),
            ]),
            SizedBox(height: r.hp(2)),
            // Search
            Container(
              padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.2)),
              decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(r.wp(3))),
              child: Row(children: [
                Icon(Icons.search, color: Colors.white54, size: r.sp(16)),
                SizedBox(width: r.wp(2.5)),
                Expanded(child: TextField(
                  onChanged: (v) => setState(() { _search = v; _openIdx = null; }),
                  style: TextStyle(fontSize: r.sp(13), color: Colors.white),
                  decoration: InputDecoration(hintText: 'Search questions...', hintStyle: TextStyle(color: Colors.white38), border: InputBorder.none, isDense: true),
                )),
              ]),
            ),
          ]),
        ),
        // Tabs
        if (_search.isEmpty) SizedBox(height: r.hp(6), child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(1)),
          itemCount: _cats.length,
          separatorBuilder: (_, __) => SizedBox(width: r.wp(2)),
          itemBuilder: (_, i) {
            final c = _cats[i]; final active = _activeCat == c['id'];
            return GestureDetector(
              onTap: () => setState(() { _activeCat = c['id'] as String; _openIdx = null; }),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.8)),
                decoration: BoxDecoration(color: active ? navy : blueGhost, borderRadius: BorderRadius.circular(r.wp(2))),
                child: Row(children: [
                  Icon(c['icon'] as IconData, size: r.sp(14), color: active ? Colors.white : const Color(0xFF6B7280)),
                  SizedBox(width: r.wp(1.5)),
                  Text(c['title'] as String, style: TextStyle(fontSize: r.sp(11), fontWeight: FontWeight.w700, color: active ? Colors.white : const Color(0xFF6B7280))),
                ]),
              ),
            );
          },
        )),
        // List
        Expanded(child: _filtered.isEmpty
          ? Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.help_outline, size: 40, color: Color(0xFFE2E8F0)),
              SizedBox(height: r.hp(1.5)),
              Text('No results', style: TextStyle(fontSize: r.sp(13), color: const Color(0xFF6B7280))),
            ]))
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: r.wp(5)),
              itemCount: _filtered.length,
              itemBuilder: (_, i) {
                final item = _filtered[i]; final open = _openIdx == i;
                return Column(children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    trailing: AnimatedRotation(turns: open ? 0.5 : 0, duration: const Duration(milliseconds: 200),
                      child: const Icon(Icons.expand_more, color: Color(0xFF9CA3AF))),
                    onTap: () => setState(() => _openIdx = open ? null : i),
                  ),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Padding(padding: EdgeInsets.only(bottom: r.hp(2)),
                    crossFadeState: open ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 250),
                  ),
                  const Divider(height: 1),
                ]);
              },
            ),
        ),
        // Support
        Padding(padding: EdgeInsets.all(r.wp(5)), child: Container(
          padding: EdgeInsets.all(r.wp(5)),
          decoration: BoxDecoration(color: bluePale, borderRadius: BorderRadius.circular(r.wp(4))),
          child: Column(children: [
            const Icon(Icons.chat_bubble_outline, size: 28, color: blue),
            SizedBox(height: r.hp(1)),
            Text('Still have questions?', style: TextStyle(fontSize: r.sp(14), fontWeight: FontWeight.w700)),
            Text('Our support team is here to help', style: TextStyle(fontSize: r.sp(11), color: const Color(0xFF6B7280))),
            SizedBox(height: r.hp(1.5)),
            ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: navy,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.wp(3)))),
              child: Text('Contact Support', style: TextStyle(fontSize: r.sp(12), fontWeight: FontWeight.w700, color: Colors.white))),
          ]),
        )),
      ]),
    );
  }
}
