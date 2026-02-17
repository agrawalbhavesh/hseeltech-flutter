import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RiskDisclosureScreen extends StatefulWidget {
  const RiskDisclosureScreen({Key? key}) : super(key: key);

  @override
  _RiskDisclosureScreenState createState() => _RiskDisclosureScreenState();
}

class _RiskDisclosureScreenState extends State<RiskDisclosureScreen> {
  String _lang = 'ar';

  void _toggleLanguage() {
    setState(() {
      _lang = _lang == 'ar' ? 'en' : 'ar';
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);
    final isRTL = _lang == 'ar';
    final t = _content[_lang]!;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: r.wp(4),
                  right: r.wp(4),
                  top: r.hp(1.5),
                  bottom: r.hp(1),
                ),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB)))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            isRTL ? Icons.chevron_right : Icons.arrow_back_ios_new,
                            size: r.icon(20),
                            color: const Color(0xFF0C6B3E),
                          ),
                          label: Text(
                            t['backLabel']!,
                            style: styles.body.copyWith(color: const Color(0xFF0C6B3E)),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        OutlinedButton(
                          onPressed: _toggleLanguage,
                          child: Text(
                            _lang == 'ar' ? 'English' : 'عربي', 
                            style: styles.caption.copyWith(color: const Color(0xFF0C6B3E))
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF0C6B3E)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(r.radius(20)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(0.5)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                    r.verticalSpace(8),
                    Row(
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.amber.shade500, size: r.icon(22)),
                        r.horizontalSpace(8),
                        Text(t['title']!, style: styles.heading3),
                      ],
                    ),
                    r.verticalSpace(4),
                    Text(t['lastUpdated']!, style: styles.caption.copyWith(color: Colors.grey.shade600)),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
                  children: [
                    _buildInfoCard(r, styles, text: t['intro']!, color: Colors.amber),
                    r.verticalSpace(12),
                    ...t['sections']!.map((section) => Padding(
                      padding: EdgeInsets.only(bottom: r.hp(1.5)),
                      child: _buildRiskSection(r, styles, section),
                    )),
                    _buildInfoCard(r, styles, text: t['disclaimer']!, color: Colors.red, isBold: true),
                    r.verticalSpace(12),
                    _buildAcknowledgmentCard(r, styles, text: t['acknowledgment']!),
                    r.verticalSpace(16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(Responsive r, AppTextStyles styles, {required String text, required Color color, bool isBold = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        border: Border.all(color: color.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(r.radius(12)),
      ),
      child: Text(
        text,
        style: styles.caption.copyWith(
          color: color.shade800,
          fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildRiskSection(Responsive r, AppTextStyles styles, Map<String, String> section) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(r.radius(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(section['icon']!, style: TextStyle(fontSize: r.sp(16))),
              r.horizontalSpace(8),
              Text(section['title']!, style: styles.body.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          r.verticalSpace(8),
          Text(
            section['body']!,
            style: styles.caption.copyWith(color: Colors.grey.shade700, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildAcknowledgmentCard(Responsive r, AppTextStyles styles, {required String text}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(r.radius(12)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: styles.caption.copyWith(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
      ),
    );
  }
}

const _content = {
  'en': {
    'title': 'Risk Disclosure',
    'lastUpdated': 'Last Updated: February 2026',
    'backLabel': 'Back',
    'intro': 'Please read this Risk Disclosure carefully before making any investment through the Hseeltech platform. Investing in real estate involves significant risks, and you should fully understand these risks before proceeding.',
    'sections': [
      {
        'title': 'Market Risk',
        'icon': '📉',
        'body': 'Real estate values are subject to fluctuations due to economic conditions, market supply and demand, interest rates, and other factors. The value of your investment may decrease, and you may receive less than your original investment amount upon exit.'
      },
      {
        'title': 'Return Risk',
        'icon': '📊',
        'body': 'All returns displayed on the Platform are estimated/expected returns based on projections and historical data. These are NOT guaranteed. Actual returns may be significantly lower than projected, or you may receive no returns at all. Factors affecting returns include:

• Vacancy rates and tenant defaults.
• Property maintenance and unexpected repair costs.
• Changes in rental market conditions.
• Property management performance.
• Economic downturns affecting property values.'
      },
      {
        'title': 'Liquidity Risk',
        'icon': '🔒',
        'body': 'Real estate investments are inherently illiquid. Unlike stocks or bonds, you cannot easily sell your fractional ownership tokens on demand. The secondary market is currently under development (coming soon). Until it is available, you should consider your investment as locked for the duration of the investment term.

You should only invest funds that you do not need for immediate or short-term expenses.'
      },
      {
        'title': 'Regulatory Risk',
        'icon': '⚖️',
        'body': 'Hseeltech currently operates within REGA's Regulatory Sandbox. This means:

• The platform is being tested under regulatory supervision.
• There is no guarantee that Hseeltech will receive a formal license after the sandbox period.
• Regulatory changes may affect the platform's ability to operate or the terms of your investment.
• New regulations may impose additional costs or restrictions.'
      },
      {
        'title': 'Capital Risk',
        'icon': '💰',
        'body': 'Your invested capital is at risk. You may lose part or all of your investment. Real estate investments do not carry deposit protection or government guarantees. Hseeltech does not guarantee the return of your principal investment.'
      },
      {
        'title': 'Concentration Risk',
        'icon': '🏢',
        'body': 'Investing a large portion of your portfolio in a single property or asset class increases your exposure to specific risks. We recommend diversifying your investments across multiple opportunities to manage risk.'
      },
      {
        'title': 'Operational Risk',
        'icon': '⚙️',
        'body': 'Operational risks include potential issues with property management, tenant relations, regulatory compliance, technology failures, or other operational challenges that may affect the performance of your investment.'
      },
      {
        'title': 'Force Majeure',
        'icon': '🌍',
        'body': 'Events beyond our control, such as natural disasters, pandemics, wars, or significant economic disruptions, may adversely affect property values, rental income, and the overall performance of your investment.'
      }
    ],
    'disclaimer': 'This Risk Disclosure does not cover all possible risks associated with real estate investment. You should carefully consider your financial situation, investment objectives, and risk tolerance before investing. We strongly recommend seeking independent financial and legal advice before making any investment decision.',
    'acknowledgment': 'By investing through Hseeltech, you acknowledge that you have read, understood, and accepted all the risks described in this disclosure.'
  },
  'ar': {
    'title': 'إفصاح المخاطر',
    'lastUpdated': 'آخر تحديث: فبراير 2026',
    'backLabel': 'رجوع',
    'intro': 'يرجى قراءة إفصاح المخاطر هذا بعناية قبل إجراء أي استثمار عبر منصة حصيلتك. ينطوي الاستثمار في العقارات على مخاطر كبيرة، ويجب أن تفهم هذه المخاطر بالكامل قبل المتابعة.',
    'sections': [
      {
        'title': 'مخاطر السوق',
        'icon': '📉',
        'body': 'تتعرض قيم العقارات للتقلبات بسبب الظروف الاقتصادية والعرض والطلب في السوق وأسعار الفائدة وعوامل أخرى. قد تنخفض قيمة استثمارك، وقد تحصل على أقل من مبلغ استثمارك الأصلي عند التخارج.'
      },
      {
        'title': 'مخاطر العوائد',
        'icon': '📊',
        'body': 'جميع العوائد المعروضة على المنصة هي عوائد تقديرية/متوقعة مبنية على توقعات وبيانات تاريخية. هذه العوائد غير مضمونة. قد تكون العوائد الفعلية أقل بكثير من المتوقع، أو قد لا تحصل على أي عوائد. العوامل المؤثرة على العوائد تشمل:

• معدلات الشغور وتخلف المستأجرين عن السداد.
• تكاليف صيانة العقار والإصلاحات غير المتوقعة.
• التغيرات في ظروف سوق الإيجار.
• أداء إدارة العقار.
• الانكماش الاقتصادي المؤثر على قيم العقارات.'
      },
      {
        'title': 'مخاطر السيولة',
        'icon': '🔒',
        'body': 'الاستثمارات العقارية بطبيعتها غير سائلة. على عكس الأسهم أو السندات، لا يمكنك بيع حصص ملكيتك الجزئية بسهولة عند الطلب. السوق الثانوي قيد التطوير حالياً (قريباً). حتى توفره، يجب اعتبار استثمارك مقيداً طوال مدة الاستثمار.

يجب أن تستثمر فقط الأموال التي لا تحتاجها لنفقات فورية أو قصيرة الأجل.'
      },
      {
        'title': 'المخاطر التنظيمية',
        'icon': '⚖️',
        'body': 'تعمل حصيلتك حالياً ضمن البيئة التنظيمية التجريبية التابعة للهيئة العامة للعقار. هذا يعني:

• يتم اختبار المنصة تحت إشراف تنظيمي.
• لا يوجد ضمان بأن حصيلتك ستحصل على ترخيص رسمي بعد فترة البيئة التجريبية.
• قد تؤثر التغييرات التنظيمية على قدرة المنصة على العمل أو على شروط استثمارك.
• قد تفرض الأنظمة الجديدة تكاليف أو قيود إضافية.'
      },
      {
        'title': 'مخاطر رأس المال',
        'icon': '💰',
        'body': 'رأس مالك المستثمر معرض للمخاطر. قد تخسر جزءاً أو كل استثمارك. لا تحمل الاستثمارات العقارية حماية الودائع أو ضمانات حكومية. لا تضمن حصيلتك استرداد رأس مالك الأصلي.'
      },
      {
        'title': 'مخاطر التركز',
        'icon': '🏢',
        'body': 'استثمار جزء كبير من محفظتك في عقار واحد أو فئة أصول واحدة يزيد من تعرضك لمخاطر محددة. نوصي بتنويع استثماراتك عبر فرص متعددة لإدارة المخاطر.'
      },
      {
        'title': 'المخاطر التشغيلية',
        'icon': '⚙️',
        'body': 'تشمل المخاطر التشغيلية المشاكل المحتملة في إدارة العقار وعلاقات المستأجرين والامتثال التنظيمي والأعطال التقنية أو التحديات التشغيلية الأخرى التي قد تؤثر على أداء استثمارك.'
      },
      {
        'title': 'القوة القاهرة',
        'icon': '🌍',
        'body': 'الأحداث الخارجة عن سيطرتنا، مثل الكوارث الطبيعية والأوبئة والحروب أو الاضطرابات الاقتصادية الكبيرة، قد تؤثر سلباً على قيم العقارات ودخل الإيجار والأداء العام لاستثمارك.'
      }
    ],
    'disclaimer': 'لا يغطي إفصاح المخاطر هذا جميع المخاطر المحتملة المرتبطة بالاستثمار العقاري. يجب أن تدرس بعناية وضعك المالي وأهدافك الاستثمارية ومدى تحملك للمخاطر قبل الاستثمار. نوصي بشدة بالحصول على استشارة مالية وقانونية مستقلة قبل اتخاذ أي قرار استثماري.',
    'acknowledgment': 'بالاستثمار عبر حصيلتك، فإنك تقر بأنك قد قرأت وفهمت وقبلت جميع المخاطر الموضحة في هذا الإفصاح.'
  }
};
