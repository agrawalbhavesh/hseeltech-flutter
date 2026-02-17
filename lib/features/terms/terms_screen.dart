import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Assuming AppTextStyles and AppSpacing are in these paths
// import 'package:hseeltech/utils/app_text_styles.dart'; 
// import 'package:hseeltech/utils/app_spacing.dart';

// Mock classes for AppTextStyles and AppSpacing until they are available
class AppTextStyles {
  final Responsive r;
  AppTextStyles(this.r);
  TextStyle get heading1 => TextStyle(fontSize: r.sp(24), fontWeight: FontWeight.bold);
  TextStyle get body => TextStyle(fontSize: r.sp(14));
  TextStyle get bodySmall => TextStyle(fontSize: r.sp(12));
}

class AppSpacing {
  final Responsive r;
  AppSpacing(this.r);
}

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  String _lang = 'ar';
  int? _expandedSection = 0;

  void _toggleLanguage() {
    setState(() {
      _lang = _lang == 'ar' ? 'en' : 'ar';
    });
  }

  void _toggleSection(int index) {
    setState(() {
      _expandedSection = _expandedSection == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final isRTL = _lang == 'ar';
    final t = _lang == 'ar' ? _content['ar']! : _content['en']!;

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(r, styles, isRTL, t),
              Expanded(
                child: _buildContent(r, styles, isRTL, t),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles, bool isRTL, Map<String, dynamic> t) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)).copyWith(top: r.hp(5)),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  isRTL ? Icons.chevron_right : Icons.arrow_back,
                  size: r.icon(16),
                  color: const Color(0xFF2E7D32),
                ),
                label: Text(t['backLabel']!, style: styles.body.copyWith(color: const Color(0xFF2E7D32))),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              TextButton(
                onPressed: _toggleLanguage,
                child: Text(
                  _lang == 'ar' ? 'English' : 'عربي',
                  style: styles.body.copyWith(color: const Color(0xFF2E7D32)),
                ),
              ),
            ],
          ),
          r.verticalSpace(8),
          Row(
            children: [
              Icon(Icons.description, size: r.icon(20), color: const Color(0xFF2E7D32)),
              r.horizontalSpace(8),
              Text(t['title']!, style: styles.heading1.copyWith(fontSize: r.sp(18), color: const Color(0xFF111827))),
            ],
          ),
          r.verticalSpace(4),
          Text(t['lastUpdated']!, style: styles.bodySmall.copyWith(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildContent(Responsive r, AppTextStyles styles, bool isRTL, Map<String, dynamic> t) {
    final sections = t['sections'] as List<Map<String, String>>;
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
      itemCount: sections.length,
      separatorBuilder: (context, index) => r.verticalSpace(8),
      itemBuilder: (context, index) {
        final section = sections[index];
        final isExpanded = _expandedSection == index;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(r.radius(12)),
            border: Border.all(color: const Color(0xFFF3F4F6)),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () => _toggleSection(index),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          section['title']!,
                          style: styles.body.copyWith(fontWeight: FontWeight.w600, color: const Color(0xFF111827)),
                        ),
                      ),
                      r.horizontalSpace(8),
                      Transform.rotate(
                        angle: isExpanded ? (isRTL ? -1.5708 : 1.5708) : 0, // 90 degrees in radians
                        child: Icon(isRTL ? Icons.chevron_left : Icons.chevron_right, size: r.icon(16), color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: EdgeInsets.only(left: r.wp(4), right: r.wp(4), bottom: r.hp(2)),
                  child: Text(
                    section['body']!,
                    style: styles.bodySmall.copyWith(color: Colors.grey[700], height: 1.6),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

final _content = {
  'en': {
    'title': 'Terms & Conditions',
    'lastUpdated': 'Last Updated: February 2026',
    'backLabel': 'Back',
    'sections': [
      {
        'title': '1. Acceptance of Terms',
        'body': 'By accessing or using the Hseeltech platform ('Platform'), you agree to be bound by these Terms and Conditions ('Terms'). If you do not agree to these Terms, you must not use the Platform.

These Terms constitute a legally binding agreement between you ('Investor', 'you') and Hseeltech Company ('Hseeltech', 'we', 'us').'
      },
      {
        'title': '2. Platform Description',
        'body': 'Hseeltech operates a fractional real estate investment platform that allows qualified investors to invest in real estate opportunities in the Kingdom of Saudi Arabia. The Platform enables investors to purchase fractional ownership tokens in curated real estate properties starting from SAR 500.

The Platform is currently operating within REGA's Regulatory Sandbox. This product/service is being tested within the regulatory sandbox environment and is not formally licensed or endorsed by the General Real Estate Authority.'
      },
      {
        'title': '3. Investor Eligibility',
        'body': 'To use the Platform, you must meet the following eligibility criteria:

• You must be at least 18 years of age.
• You must be a resident of the Kingdom of Saudi Arabia or a qualified non-resident investor as permitted by applicable regulations.
• You must have a valid Saudi national ID or Iqama, verifiable through Nafath.
• You must successfully complete the Know Your Customer (KYC) and Anti-Money Laundering (AML) verification process.
• You must have a valid Saudi bank account in your name.
• You must not be on any sanctions or restricted persons lists.

Hseeltech reserves the right to refuse service to any individual who does not meet these criteria or whose participation may pose a risk to the Platform or other investors.'
      },
      {
        'title': '4. Investment Risks',
        'body': 'By investing through the Platform, you acknowledge and accept the following risks:

• Real estate investments are subject to market fluctuations and may decrease in value.
• All returns displayed on the Platform are estimated/expected and are not guaranteed.
• Past performance is not indicative of future results.
• Your invested capital is at risk and you may lose part or all of your investment.
• Real estate investments are inherently illiquid (see Section 7 - Secondary Market).
• Regulatory changes may affect the Platform's operations or your investments.
• There is no guarantee that Hseeltech will receive a formal license from REGA after the sandbox period.

You should only invest amounts that you can afford to lose and should consider seeking independent financial advice.'
      },
      {
        'title': '5. Account & Security',
        'body': 'You are responsible for maintaining the confidentiality of your account credentials, including your PIN and any authentication methods. You must notify us immediately of any unauthorized access to your account.

Hseeltech is not liable for any losses resulting from unauthorized access to your account due to your failure to maintain the security of your credentials.'
      },
      {
        'title': '6. Fees & Charges',
        'body': 'Fees associated with each investment opportunity are disclosed on the opportunity detail page before you confirm your investment. These may include:

• Platform service fees.
• Property management fees.
• Transaction processing fees.
• Exit/disposal fees upon property sale.

All applicable fees will be clearly displayed before you confirm any transaction. Hseeltech reserves the right to modify its fee structure with prior notice to investors.'
      },
      {
        'title': '7. Secondary Market',
        'body': 'A secondary market for trading fractional ownership tokens is currently under development and will be available soon. Until the secondary market is launched:

• Investments should be considered illiquid.
• You may not be able to sell or transfer your tokens immediately.
• The investment holding period depends on the specific opportunity terms.

We will notify all investors when the secondary market becomes available.'
      },
      {
        'title': '8. Distributions & Returns',
        'body': 'Rental income distributions are made according to the schedule specified in each investment opportunity. Distribution amounts depend on actual rental income received, property expenses, and management costs.

All returns mentioned on the Platform are estimated and subject to change based on actual property performance. Hseeltech does not guarantee any specific return on investment.'
      },
      {
        'title': '9. Intellectual Property',
        'body': 'All content on the Platform, including but not limited to text, graphics, logos, images, and software, is the property of Hseeltech and is protected by applicable intellectual property laws. You may not reproduce, distribute, or create derivative works from any Platform content without our prior written consent.'
      },
      {
        'title': '10. Limitation of Liability',
        'body': 'To the maximum extent permitted by law, Hseeltech shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the Platform or any investment made through it.

Hseeltech's total liability to you for any claims arising from these Terms shall not exceed the total fees paid by you to Hseeltech in the 12 months preceding the claim.'
      },
      {
        'title': '11. Communication & Support',
        'body': 'For questions, complaints, or support requests, you can reach us through:

• In-App Support: Available through the Profile > Support section.
• Email: support@hseeltech.com
• Phone: +966 XX XXX XXXX
• Response Time: We aim to respond to all inquiries within 2 business days.

For urgent matters related to your investments or account security, please contact us immediately via phone.'
      },
      {
        'title': '12. Governing Law',
        'body': 'These Terms are governed by and construed in accordance with the laws of the Kingdom of Saudi Arabia. Any disputes arising from these Terms shall be subject to the exclusive jurisdiction of the competent courts in the Kingdom of Saudi Arabia.'
      },
      {
        'title': '13. Amendments',
        'body': 'Hseeltech reserves the right to amend these Terms at any time. Material changes will be communicated to you via the Platform or email at least 30 days before they take effect. Your continued use of the Platform after such changes constitutes your acceptance of the amended Terms.'
      }
    ]
  },
  'ar': {
    'title': 'الشروط والأحكام',
    'lastUpdated': 'آخر تحديث: فبراير 2026',
    'backLabel': 'رجوع',
    'sections': [
      {
        'title': '1. قبول الشروط',
        'body': 'باستخدامك أو وصولك إلى منصة حصيلتك ('المنصة'), فإنك توافق على الالتزام بهذه الشروط والأحكام ('الشروط'). إذا لم توافق على هذه الشروط, يجب عليك عدم استخدام المنصة.

تشكل هذه الشروط اتفاقية ملزمة قانوناً بينك ('المستثمر', 'أنت') وبين شركة حصيلتك ('حصيلتك', 'نحن', 'لنا').'
      },
      {
        'title': '2. وصف المنصة',
        'body': 'تدير حصيلتك منصة للاستثمار العقاري الجزئي تتيح للمستثمرين المؤهلين الاستثمار في فرص عقارية في المملكة العربية السعودية. تمكّن المنصة المستثمرين من شراء حصص ملكية جزئية في عقارات مختارة بدءاً من 500 ريال سعودي.

تعمل المنصة حالياً ضمن البيئة التنظيمية التجريبية التابعة للهيئة العامة للعقار. هذا المنتج/الخدمة قيد الاختبار ضمن البيئة التنظيمية التجريبية ولم يُرخص أو يُعتمد رسمياً من الهيئة العامة للعقار.'
      },
      {
        'title': '3. أهلية المستثمر',
        'body': 'لاستخدام المنصة, يجب أن تستوفي معايير الأهلية التالية:

• يجب أن يكون عمرك 18 عاماً على الأقل.
• يجب أن تكون مقيماً في المملكة العربية السعودية أو مستثمراً غير مقيم مؤهلاً وفقاً للأنظمة المعمول بها.
• يجب أن تمتلك هوية وطنية سعودية أو إقامة صالحة, قابلة للتحقق عبر نفاذ.
• يجب أن تجتاز بنجاح عملية التحقق من اعرف عميلك (KYC) ومكافحة غسل الأموال (AML).
• يجب أن يكون لديك حساب بنكي سعودي صالح باسمك.
• يجب ألا تكون مدرجاً في أي قوائم عقوبات أو أشخاص محظورين.

تحتفظ حصيلتك بالحق في رفض تقديم الخدمة لأي فرد لا يستوفي هذه المعايير أو قد تشكل مشاركته خطراً على المنصة أو المستثمرين الآخرين.'
      },
      {
        'title': '4. مخاطر الاستثمار',
        'body': 'بالاستثمار عبر المنصة, فإنك تقر وتقبل المخاطر التالية:

• الاستثمارات العقارية عرضة لتقلبات السوق وقد تنخفض قيمتها.
• جميع العوائد المعروضة على المنصة تقديرية/متوقعة وغير مضمونة.
• الأداء السابق لا يعد مؤشراً على النتائج المستقبلية.
• رأس مالك المستثمر معرض للمخاطر وقد تخسر جزءاً أو كل استثمارك.
• الاستثمارات العقارية بطبيعتها غير سائلة (انظر القسم 7 - السوق الثانوي).
• قد تؤثر التغييرات التنظيمية على عمليات المنصة أو استثماراتك.
• لا يوجد ضمان بأن حصيلتك ستحصل على ترخيص رسمي من الهيئة العامة للعقار بعد فترة البيئة التجريبية.

يجب أن تستثمر فقط المبالغ التي يمكنك تحمل خسارتها ويُنصح بالحصول على استشارة مالية مستقلة.'
      },
      {
        'title': '5. الحساب والأمان',
        'body': 'أنت مسؤول عن الحفاظ على سرية بيانات حسابك, بما في ذلك رقم التعريف الشخصي (PIN) وأي وسائل مصادقة. يجب عليك إخطارنا فوراً بأي وصول غير مصرح به لحسابك.

لا تتحمل حصيلتك أي مسؤولية عن الخسائر الناتجة عن الوصول غير المصرح به لحسابك بسبب عدم حفاظك على أمان بيانات الدخول.'
      },
      {
        'title': '6. الرسوم والتكاليف',
        'body': 'يتم الإفصاح عن الرسوم المرتبطة بكل فرصة استثمارية في صفحة تفاصيل الفرصة قبل تأكيد استثمارك. قد تشمل:

• رسوم خدمة المنصة.
• رسوم إدارة العقار.
• رسوم معالجة المعاملات.
• رسوم التخارج/التصرف عند بيع العقار.

سيتم عرض جميع الرسوم المطبقة بوضوح قبل تأكيد أي معاملة. تحتفظ حصيلتك بالحق في تعديل هيكل الرسوم مع إشعار مسبق للمستثمرين.'
      },
      {
        'title': '7. السوق الثانوي',
        'body': 'السوق الثانوي لتداول حصص الملكية الجزئية قيد التطوير حالياً وسيكون متاحاً قريباً. حتى إطلاق السوق الثانوي:

• يجب اعتبار الاستثمارات غير سائلة.
• قد لا تتمكن من بيع أو نقل حصصك فوراً.
• تعتمد فترة الاحتفاظ بالاستثمار على شروط الفرصة المحددة.

سنقوم بإخطار جميع المستثمرين عند توفر السوق الثانوي.'
      },
      {
        'title': '8. التوزيعات والعوائد',
        'body': 'يتم توزيع دخل الإيجار وفقاً للجدول المحدد في كل فرصة استثمارية. تعتمد مبالغ التوزيعات على دخل الإيجار الفعلي المحصل ومصروفات العقار وتكاليف الإدارة.

جميع العوائد المذكورة على المنصة تقديرية وقابلة للتغيير بناءً على الأداء الفعلي للعقار. لا تضمن حصيلتك أي عائد محدد على الاستثمار.'
      },
      {
        'title': '9. الملكية الفكرية',
        'body': 'جميع المحتوى على المنصة, بما في ذلك على سبيل المثال لا الحصر النصوص والرسومات والشعارات والصور والبرمجيات, هو ملك لحصيلتك ومحمي بموجب قوانين الملكية الفكرية المعمول بها. لا يجوز لك إعادة إنتاج أو توزيع أو إنشاء أعمال مشتقة من أي محتوى على المنصة دون موافقتنا الخطية المسبقة.'
      },
      {
        'title': '10. حدود المسؤولية',
        'body': 'إلى أقصى حد يسمح به النظام, لا تتحمل حصيلتك أي مسؤولية عن أي أضرار غير مباشرة أو عرضية أو خاصة أو تبعية أو عقابية ناشئة عن استخدامك للمنصة أو أي استثمار تم من خلالها.

لا تتجاوز المسؤولية الإجمالية لحصيلتك تجاهك عن أي مطالبات ناشئة عن هذه الشروط إجمالي الرسوم التي دفعتها لحصيلتك في الـ 12 شهراً السابقة للمطالبة.'
      },
      {
        'title': '11. التواصل والدعم',
        'body': 'للاستفسارات أو الشكاوى أو طلبات الدعم, يمكنك التواصل معنا عبر:

• الدعم داخل التطبيق: متاح من خلال الملف الشخصي > الدعم.
• البريد الإلكتروني: support@hseeltech.com
• الهاتف: +966 XX XXX XXXX
• وقت الاستجابة: نسعى للرد على جميع الاستفسارات خلال يومي عمل.

للأمور العاجلة المتعلقة باستثماراتك أو أمان حسابك, يرجى التواصل معنا فوراً عبر الهاتف.'
      },
      {
        'title': '12. القانون الحاكم',
        'body': 'تخضع هذه الشروط وتُفسر وفقاً لأنظمة المملكة العربية السعودية. تخضع أي نزاعات ناشئة عن هذه الشروط للاختصاص الحصري للمحاكم المختصة في المملكة العربية السعودية.'
      },
      {
        'title': '13. التعديلات',
        'body': 'تحتفظ حصيلتك بالحق في تعديل هذه الشروط في أي وقت. سيتم إبلاغك بالتغييرات الجوهرية عبر المنصة أو البريد الإلكتروني قبل 30 يوماً على الأقل من سريانها. استمرارك في استخدام المنصة بعد هذه التغييرات يعني قبولك للشروط المعدلة.'
      }
    ]
  }
};
