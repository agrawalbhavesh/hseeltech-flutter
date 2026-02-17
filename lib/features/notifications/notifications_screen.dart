import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Assuming these are defined elsewhere in the project
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);

  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold, color: const Color(0xFF1B2A4A));
  TextStyle get body => TextStyle(fontSize: r.sp(16), color: const Color(0xFF1B1B1B));
  TextStyle get caption => TextStyle(fontSize: r.sp(12), color: const Color(0xFF6B7280));
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);
}

class C {
  static const Color navy = Color(0xFF1B2A4A);
  static const Color blue = Color(0xFF2E5090);
  static const Color blueLight = Color(0xFF4A7BC7);
  static const Color bluePale = Color(0xFFEDF2F9);
  static const Color blueGhost = Color(0xFFF5F8FC);
  static const Color green = Color(0xFF2D6A4F);
  static const Color greenLight = Color(0xFFE8F5E9);
  static const Color red = Color(0xFFC62828);
  static const Color redLight = Color(0xFFFFEBEE);
  static const Color orange = Color(0xFFE65100);
  static const Color orangeLight = Color(0xFFFFF3E0);
  static const Color dark = Color(0xFF1B1B1B);
  static const Color gray = Color(0xFF6B7280);
  static const Color grayLight = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE2E8F0);
  static const Color gold = Color(0xFFB8860B);
  static const Color goldLight = Color(0xFFFFF8E1);
}

enum NotifType { investment, wallet, reward, system, kyc }

class NotificationModel {
  final String id;
  final NotifType type;
  final String title;
  final String message;
  final String time;
  bool read;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  NotificationModel({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.time,
    required this.read,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<NotificationModel> notifs;
  String filter = "all";

  @override
  void initState() {
    super.initState();
    notifs = [
      NotificationModel(id: "1", type: NotifType.investment, title: "Dividend Distributed", message: "Your Q4 2025 rental dividend of 312.50 SAR for Al Olaya Towers has been credited to your wallet.", time: "2 hours ago", read: false, icon: Icons.trending_up, iconBg: C.greenLight, iconColor: C.green),
      NotificationModel(id: "2", type: NotifType.wallet, title: "Deposit Received", message: "Your bank transfer of 10,000 SAR has been received and credited to your wallet.", time: "5 hours ago", read: false, icon: Icons.account_balance_wallet, iconBg: C.bluePale, iconColor: C.navy),
      NotificationModel(id: "3", type: NotifType.reward, title: "Tier Upgrade!", message: "Congratulations! You've been upgraded to Pioneer tier. Enjoy enhanced benefits and priority access.", time: "1 day ago", read: false, icon: Icons.emoji_events, iconBg: C.goldLight, iconColor: C.gold),
      NotificationModel(id: "4", type: NotifType.investment, title: "New Opportunity Available", message: "A new investment opportunity 'Riyadh Business Park' is now available. Starting at 500 SAR per share.", time: "1 day ago", read: true, icon: Icons.business, iconBg: C.bluePale, iconColor: C.blue),
      NotificationModel(id: "5", type: NotifType.system, title: "KYC Verification Complete", message: "Your identity verification has been approved. You can now invest and withdraw funds.", time: "2 days ago", read: true, icon: Icons.person_add_alt_1, iconBg: C.greenLight, iconColor: C.green),
      NotificationModel(id: "6", type: NotifType.wallet, title: "Withdrawal Processed", message: "Your withdrawal of 5,000 SAR has been processed and sent to your verified bank account.", time: "3 days ago", read: true, icon: Icons.credit_card, iconBg: C.bluePale, iconColor: C.navy),
      NotificationModel(id: "7", type: NotifType.reward, title: "Referral Bonus Earned", message: "Your friend Mohammed joined and completed KYC. You've earned 50 SAR referral bonus!", time: "4 days ago", read: true, icon: Icons.card_giftcard, iconBg: C.goldLight, iconColor: C.gold),
      NotificationModel(id: "8", type: NotifType.investment, title: "Property Valuation Update", message: "Al Olaya Towers property valuation has increased by 3.2%. Your share value has been updated.", time: "5 days ago", read: true, icon: Icons.trending_up, iconBg: C.greenLight, iconColor: C.green),
      NotificationModel(id: "9", type: NotifType.system, title: "Document Uploaded", message: "Your National ID document has been successfully uploaded and is under review.", time: "1 week ago", read: true, icon: Icons.article, iconBg: C.bluePale, iconColor: C.blue),
      NotificationModel(id: "10", type: NotifType.system, title: "Security Alert", message: "A new device was used to log in to your account. If this wasn't you, please contact support.", time: "1 week ago", read: true, icon: Icons.security, iconBg: C.orangeLight, iconColor: C.orange),
    ];
  }

  void markRead(String id) {
    setState(() {
      final index = notifs.indexWhere((n) => n.id == id);
      if (index != -1) {
        notifs[index].read = true;
      }
    });
  }

  void markAllRead() {
    setState(() {
      for (var notif in notifs) {
        notif.read = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    final unreadCount = notifs.where((n) => !n.read).length;
    final filtered = filter == "all" ? notifs : notifs.where((n) => n.type.name == filter).toList();

    final filters = [
      {"key": "all", "label": "All"},
      {"key": "investment", "label": "Investment"},
      {"key": "wallet", "label": "Wallet"},
      {"key": "reward", "label": "Rewards"},
      {"key": "system", "label": "System"},
    ];

    return Scaffold(
      backgroundColor: C.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            _buildHeader(r, styles, unreadCount),
            _buildFilters(r, styles, filters),
            Expanded(
              child: filtered.isEmpty
                  ? _buildEmptyState(r, styles)
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        return NotificationItem(
                          notif: filtered[index],
                          onRead: markRead,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles, int unreadCount) {
    return Container(
      padding: EdgeInsets.only(left: r.wp(4), right: r.wp(4), top: r.hp(6), bottom: r.hp(1.5)),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [C.navy, C.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                'https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/QotVlztmCuPIBZGl.png',
                width: r.wp(8),
                height: r.wp(8),
              ),
              r.horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notifications", style: TextStyle(fontSize: r.sp(18), fontWeight: FontWeight.w800, color: C.white)),
                  if (unreadCount > 0)
                    Text("$unreadCount unread", style: TextStyle(fontSize: r.sp(10), color: C.white.withOpacity(0.6))),
                ],
              ),
            ],
          ),
          if (unreadCount > 0)
            GestureDetector(
              onTap: markAllRead,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.75)),
                decoration: BoxDecoration(
                  color: C.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(r.radius(8)),
                ),
                child: Text("Mark all read", style: TextStyle(fontSize: r.sp(10), fontWeight: FontWeight.bold, color: C.white)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilters(Responsive r, AppTextStyles styles, List<Map<String, String>> filters) {
    return Container(
      color: C.blueGhost,
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((f) {
            final key = f['key']!;
            final count = key == "all" ? notifs.length : notifs.where((n) => n.type.name == key).length;
            final isActive = filter == key;
            return Padding(
              padding: EdgeInsets.only(right: r.wp(2)),
              child: GestureDetector(
                onTap: () => setState(() => filter = key),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(1)),
                  decoration: BoxDecoration(
                    color: isActive ? C.navy : C.white,
                    borderRadius: BorderRadius.circular(r.radius(12)),
                    border: Border.all(color: isActive ? C.navy : C.border),
                  ),
                  child: Row(
                    children: [
                      Text(f['label']!, style: TextStyle(fontSize: r.sp(10), fontWeight: FontWeight.bold, color: isActive ? C.white : C.gray)),
                      r.horizontalSpace(6),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: r.wp(1.5), vertical: r.hp(0.25)),
                        decoration: BoxDecoration(
                          color: isActive ? C.white.withOpacity(0.2) : C.bluePale,
                          borderRadius: BorderRadius.circular(r.radius(6)),
                        ),
                        child: Text(
                          count.toString(),
                          style: TextStyle(fontSize: r.sp(8), fontWeight: FontWeight.bold, color: isActive ? C.white : C.navy),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEmptyState(Responsive r, AppTextStyles styles) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(8), vertical: r.hp(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: r.wp(16),
            height: r.wp(16),
            decoration: const BoxDecoration(
              color: C.bluePale,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.notifications_off, color: C.grayLight, size: r.icon(32)),
          ),
          r.verticalSpace(16),
          Text("No notifications", style: TextStyle(fontSize: r.sp(14), fontWeight: FontWeight.bold, color: C.dark)),
          r.verticalSpace(4),
          Text(
            "You're all caught up! Check back later for updates.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: r.sp(11), color: C.grayLight),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notif;
  final Function(String) onRead;

  const NotificationItem({Key? key, required this.notif, required this.onRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);

    return InkWell(
      onTap: () => onRead(notif.id),
      child: Container(
        color: notif.read ? C.white : C.blueGhost,
        padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: C.border, width: 1)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: r.wp(10),
              height: r.wp(10),
              margin: EdgeInsets.only(top: r.hp(0.5)),
              decoration: BoxDecoration(
                color: notif.iconBg,
                borderRadius: BorderRadius.circular(r.radius(12)),
              ),
              child: Icon(notif.icon, color: notif.iconColor, size: r.icon(16)),
            ),
            r.horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notif.title,
                          style: TextStyle(fontSize: r.sp(12), fontWeight: FontWeight.bold, color: C.dark),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!notif.read)
                        Container(
                          width: r.wp(2),
                          height: r.wp(2),
                          decoration: const BoxDecoration(
                            color: C.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  r.verticalSpace(4),
                  Text(
                    notif.message,
                    style: TextStyle(fontSize: r.sp(10), color: C.gray, height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  r.verticalSpace(6),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: r.icon(12), color: C.grayLight),
                      r.horizontalSpace(4),
                      Text(notif.time, style: TextStyle(fontSize: r.sp(9), color: C.grayLight)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
