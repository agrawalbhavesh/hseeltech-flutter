import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String _lang = "ar";
  int? _expandedSection;

  void _toggleLanguage() {
    setState(() {
      _lang = _lang == "ar" ? "en" : "ar";
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
    final spacing = AppSpacing(r);
    final isRTL = _lang == "ar";
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
                  border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            children: [
                              Icon(
                                isRTL ? Icons.chevron_right : Icons.arrow_back,
                                size: r.icon(16),
                                color: const Color(0xFF0C6B3E),
                              ),
                              r.horizontalSpace(4),
                              Text(t['backLabel']! as String, style: styles.body.copyWith(color: const Color(0xFF0C6B3E))),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleLanguage,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.5)),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF0C6B3E)),
                              borderRadius: BorderRadius.circular(r.radius(20)),
                            ),
                            child: Text(
                              _lang == "ar" ? "English" : "عربي",
                              style: styles.caption.copyWith(color: const Color(0xFF0C6B3E)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    r.verticalSpace(8),
                    Row(
                      children: [
                        Icon(Icons.shield_outlined, size: r.icon(20), color: const Color(0xFF0C6B3E)),
                        r.horizontalSpace(8),
                        Text(t['title']! as String, style: styles.heading2),
                      ],
                    ),
                    r.verticalSpace(4),
                    Text(t['lastUpdated']! as String, style: styles.caption.copyWith(color: Colors.grey[600])),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: r.wp(4), vertical: r.hp(2)),
                  itemCount: (t['sections']! as List).length + 1, // +1 for the PDPL reference
                  itemBuilder: (context, index) {
                    if (index == (t['sections']! as List).length) {
                      return Container(
                        margin: EdgeInsets.only(top: r.hp(2)),
                        padding: EdgeInsets.all(r.wp(4)),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0C6B3E).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(r.radius(12)),
                        ),
                        child: Text(
                          isRTL
                              ? "هذه السياسة معدة وفقاً لنظام حماية البيانات الشخصية الصادر بالمرسوم الملكي رقم (م/19) وتاريخ 1443/2/9هـ ولوائحه التنفيذية."
                              : "This policy is prepared in accordance with the Saudi Personal Data Protection Law (PDPL) issued by Royal Decree No. (M/19) dated 9/2/1443H and its implementing regulations.",
                          style: styles.caption.copyWith(color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    final section = (t['sections']! as List)[index];
                    final isExpanded = _expandedSection == index;

                    return Container(
                      margin: EdgeInsets.only(bottom: r.hp(1)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(r.radius(12)),
                        border: Border.all(color: Colors.grey[200]!),
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
                                      style: styles.body.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Icon(
                                    isExpanded ? Icons.expand_more : (isRTL ? Icons.chevron_left : Icons.chevron_right),
                                    size: r.icon(16),
                                    color: Colors.grey[400],
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
                                style: styles.body.copyWith(color: Colors.grey[700], height: 1.5),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const _content = {
  "en": {
    "title": "Privacy Policy",
    "lastUpdated": "Last Updated: February 2026",
    "backLabel": "Back",
    "sections": [
      {
        "title": "1. Introduction",
        "body": "Hseeltech ("we", "us", "our") operates a fractional real estate investment platform in the Kingdom of Saudi Arabia. We are committed to protecting your personal data in accordance with the Saudi Personal Data Protection Law (PDPL) issued by Royal Decree No. (M/19) dated 9/2/1443H, and all applicable regulations including Anti-Money Laundering (AML) and Know Your Customer (KYC) requirements.

This Privacy Policy explains how we collect, use, store, protect, and dispose of your personal data. By using our platform, you acknowledge that you have read and understood this policy."
      },
      {
        "title": "2. Data We Collect",
        "body": "We collect the following categories of personal data:

• Identity Data: Full legal name, national ID number (via Nafath verification), date of birth, nationality, and address.

• Financial Data: Bank account details, source of funds, investment history, transaction records, and credit-related information.

• Contact Data: Phone number, email address, and communication preferences.

• Technical Data: IP address, device type, operating system, browser type, and app usage analytics.

• Verification Data: Nafath authentication records, KYC documentation, and AML screening results.

We collect only the minimum data necessary to provide our services (data minimization principle, PDPL Article 11)."
      },
      {
        "title": "3. Purpose of Data Collection",
        "body": "Your personal data is collected and processed for the following purposes:

• Account registration and identity verification (KYC compliance).
• Anti-money laundering screening and ongoing monitoring (AML compliance).
• Processing investments and managing your portfolio.
• Executing financial transactions (deposits, withdrawals, distributions).
• Communicating important account updates and notifications.
• Improving our platform and user experience.
• Complying with regulatory requirements and legal obligations.

We will not process your data for purposes other than those stated above without obtaining your prior consent (PDPL Article 5)."
      },
      {
        "title": "4. Legal Basis for Processing",
        "body": "We process your personal data based on the following legal grounds under the PDPL:

• Your explicit consent provided during registration.
• Contractual necessity to fulfill our investment services agreement.
• Legal obligations under Saudi financial regulations, AML/KYC requirements, and REGA sandbox conditions.
• Legitimate interests in maintaining platform security and preventing fraud."
      },
      {
        "title": "5. Your Rights",
        "body": "Under the PDPL (Article 4), you have the following rights:

• Right to Know: You have the right to be informed about the legal basis and purpose of collecting your data.

• Right to Access: You may request a copy of your personal data held by us, free of charge.

• Right to Correction: You may request correction, completion, or updating of your personal data.

• Right to Deletion: You may request destruction of your personal data when it is no longer needed for its original purpose, subject to legal retention requirements.

• Right to Withdraw Consent: You may withdraw your consent at any time. This will not affect the lawfulness of processing carried out before withdrawal.

• Right to Object to Marketing: You may opt out of receiving marketing communications at any time.

To exercise any of these rights, contact us at privacy@hseeltech.com."
      },
      {
        "title": "6. Data Storage & Security",
        "body": "Your personal data is stored securely within the Kingdom of Saudi Arabia. We implement appropriate organizational, administrative, and technical measures to protect your data (PDPL Article 19), including:

• Encryption of data in transit and at rest.
• Access controls limiting data access to authorized personnel only.
• Regular security assessments and vulnerability testing.
• Secure backup procedures with controlled access.

We retain your data only for as long as necessary to fulfill the purposes for which it was collected, or as required by applicable laws and regulations. Upon expiry of the retention period, data will be securely destroyed (PDPL Article 18)."
      },
      {
        "title": "7. Data Sharing & Disclosure",
        "body": "We do not sell your personal data. We may share your data only in the following circumstances (PDPL Article 15):

• With regulatory authorities (REGA, SAMA, SDAIA) as required by law.
• With identity verification providers (Nafath) for KYC purposes.
• With banking partners to process financial transactions.
• With authorized service providers who process data on our behalf, under strict contractual obligations.
• When required by court order or legal proceedings.

We do not transfer your personal data outside the Kingdom of Saudi Arabia unless required by law and with appropriate safeguards in place."
      },
      {
        "title": "8. Marketing Communications",
        "body": "We will only send you marketing or promotional materials with your explicit consent (PDPL Article 25). You may withdraw this consent at any time through:

• The notification settings in your account.
• Clicking the "unsubscribe" link in any marketing email.
• Contacting us at privacy@hseeltech.com.

Essential service communications (account updates, transaction confirmations, regulatory notices) are not considered marketing and will continue regardless of your marketing preferences."
      },
      {
        "title": "9. Data Breach Notification",
        "body": "In the event of a data breach that may result in serious harm to your personal data or to you personally, we will notify you promptly in accordance with PDPL Article 20. We will also notify the relevant regulatory authority immediately upon becoming aware of any breach."
      },
      {
        "title": "10. Children's Data",
        "body": "Our platform is not intended for individuals under the age of 18. We do not knowingly collect personal data from minors. If we become aware that we have collected data from a minor, we will take immediate steps to delete it."
      },
      {
        "title": "11. Policy Updates",
        "body": "We may update this Privacy Policy from time to time to reflect changes in our practices or applicable laws. We will notify you of any material changes through the app or via email. The updated policy will be effective from the date of publication."
      },
      {
        "title": "12. Contact Us",
        "body": "For questions, complaints, or to exercise your data protection rights:

• Email: privacy@hseeltech.com
• Phone: +966 XX XXX XXXX
• Address: Riyadh, Kingdom of Saudi Arabia

We will respond to your request within the timeframe specified by the PDPL and its implementing regulations."
      }
    ]
  },
  "ar": {
    "title": "سياسة الخصوصية",
    "lastUpdated": "آخر تحديث: فبراير 2026",
    "backLabel": "رجوع",
    "sections": [
      {
        "title": "1. المقدمة",
        "body": "تدير شركة حصيلتك ("نحن", "لنا", "الشركة") منصة للاستثمار العقاري الجزئي في المملكة العربية السعودية. نلتزم بحماية بياناتك الشخصية وفقاً لنظام حماية البيانات الشخصية (PDPL) الصادر بالمرسوم الملكي رقم (م/19) وتاريخ 9/2/1443هـ، وجميع الأنظمة واللوائح المعمول بها بما في ذلك متطلبات مكافحة غسل الأموال (AML) واعرف عميلك (KYC).

توضح سياسة الخصوصية هذه كيفية جمع بياناتك الشخصية واستخدامها وتخزينها وحمايتها والتخلص منها. باستخدامك لمنصتنا، فإنك تقر بأنك قد قرأت وفهمت هذه السياسة."
      },
      {
        "title": "2. البيانات التي نجمعها",
        "body": "نجمع الفئات التالية من البيانات الشخصية:

• بيانات الهوية: الاسم الكامل، رقم الهوية الوطنية (عبر التحقق بنفاذ)، تاريخ الميلاد، الجنسية، والعنوان.

• البيانات المالية: تفاصيل الحساب البنكي، مصدر الأموال، سجل الاستثمارات، سجلات المعاملات، والمعلومات الائتمانية.

• بيانات التواصل: رقم الهاتف، البريد الإلكتروني، وتفضيلات التواصل.

• البيانات التقنية: عنوان IP، نوع الجهاز، نظام التشغيل، نوع المتصفح، وتحليلات استخدام التطبيق.

• بيانات التحقق: سجلات مصادقة نفاذ، وثائق اعرف عميلك (KYC)، ونتائج فحص مكافحة غسل الأموال (AML).

نجمع فقط الحد الأدنى من البيانات اللازمة لتقديم خدماتنا (مبدأ تقليل البيانات، المادة 11 من النظام)."
      },
      {
        "title": "3. أغراض جمع البيانات",
        "body": "تُجمع بياناتك الشخصية وتُعالج للأغراض التالية:

• تسجيل الحساب والتحقق من الهوية (امتثال KYC).
• فحص مكافحة غسل الأموال والمراقبة المستمرة (امتثال AML).
• معالجة الاستثمارات وإدارة محفظتك.
• تنفيذ المعاملات المالية (إيداعات، سحوبات، توزيعات).
• إرسال تحديثات الحساب والإشعارات المهمة.
• تحسين منصتنا وتجربة المستخدم.
• الامتثال للمتطلبات التنظيمية والالتزامات القانونية.

لن نعالج بياناتك لأغراض أخرى غير المذكورة أعلاه دون الحصول على موافقتك المسبقة (المادة 5 من النظام)."
      },
      {
        "title": "4. الأساس القانوني للمعالجة",
        "body": "نعالج بياناتك الشخصية استناداً إلى الأسس القانونية التالية بموجب نظام حماية البيانات الشخصية:

• موافقتك الصريحة المقدمة أثناء التسجيل.
• الضرورة التعاقدية لتنفيذ اتفاقية خدمات الاستثمار.
• الالتزامات القانونية بموجب الأنظمة المالية السعودية ومتطلبات AML/KYC وشروط البيئة التنظيمية التجريبية.
• المصالح المشروعة في الحفاظ على أمن المنصة ومنع الاحتيال."
      },
      {
        "title": "5. حقوقك",
        "body": "بموجب نظام حماية البيانات الشخصية (المادة 4)، لديك الحقوق التالية:

• الحق في العلم: يحق لك معرفة الأساس القانوني والغرض من جمع بياناتك.

• الحق في الوصول: يمكنك طلب نسخة من بياناتك الشخصية المحفوظة لدينا مجاناً.

• الحق في التصحيح: يمكنك طلب تصحيح أو إكمال أو تحديث بياناتك الشخصية.

• الحق في الحذف: يمكنك طلب إتلاف بياناتك الشخصية عندما لا تعود ضرورية للغرض الأصلي من جمعها، مع مراعاة متطلبات الاحتفاظ القانونية.

• الحق في سحب الموافقة: يمكنك سحب موافقتك في أي وقت. لن يؤثر ذلك على مشروعية المعالجة التي تمت قبل السحب.

• الحق في الاعتراض على التسويق: يمكنك إلغاء الاشتراك في الرسائل التسويقية في أي وقت.

لممارسة أي من هذه الحقوق، تواصل معنا على privacy@hseeltech.com."
      },
      {
        "title": "6. تخزين البيانات وأمنها",
        "body": "تُخزن بياناتك الشخصية بشكل آمن داخل المملكة العربية السعودية. نطبق إجراءات تنظيمية وإدارية وتقنية مناسبة لحماية بياناتك (المادة 19 من النظام)، تشمل:

• تشفير البيانات أثناء النقل والتخزين.
• ضوابط الوصول التي تقصر الاطلاع على البيانات على الموظفين المصرح لهم فقط.
• تقييمات أمنية دورية واختبارات الثغرات.
• إجراءات نسخ احتياطي آمنة مع وصول محكوم.

نحتفظ ببياناتك فقط للمدة اللازمة لتحقيق الأغراض التي جُمعت من أجلها، أو كما تتطلب الأنظمة واللوائح المعمول بها. عند انتهاء فترة الاحتفاظ، يتم إتلاف البيانات بشكل آمن (المادة 18 من النظام)."
      },
      {
        "title": "7. مشاركة البيانات والإفصاح",
        "body": "لا نبيع بياناتك الشخصية. قد نشارك بياناتك فقط في الحالات التالية (المادة 15 من النظام):

• مع الجهات التنظيمية (الهيئة العامة للعقار، البنك المركزي السعودي، سدايا) حسب ما يقتضيه النظام.
• مع مزودي خدمات التحقق من الهوية (نفاذ) لأغراض KYC.
• مع الشركاء المصرفيين لمعالجة المعاملات المالية.
• مع مزودي الخدمات المعتمدين الذين يعالجون البيانات نيابة عنا، بموجب التزامات تعاقدية صارمة.
• عند الطلب بأمر قضائي أو إجراءات قانونية.

لا ننقل بياناتك الشخصية خارج المملكة العربية السعودية إلا إذا اقتضى النظام ذلك مع توفير الضمانات المناسبة."
      },
      {
        "title": "8. الاتصالات التسويقية",
        "body": "لن نرسل لك مواد تسويقية أو ترويجية إلا بموافقتك الصريحة (المادة 25 من النظام). يمكنك سحب هذه الموافقة في أي وقت من خلال:

• إعدادات الإشعارات في حسابك.
• النقر على رابط "إلغاء الاشتراك" في أي بريد تسويقي.
• التواصل معنا على privacy@hseeltech.com.

الاتصالات الأساسية للخدمة (تحديثات الحساب، تأكيدات المعاملات، الإشعارات التنظيمية) لا تُعتبر تسويقية وستستمر بغض النظر عن تفضيلاتك التسويقية."
      },
      {
        "title": "9. الإخطار بخرق البيانات",
        "body": "في حالة حدوث خرق للبيانات قد يترتب عليه ضرر جسيم على بياناتك الشخصية أو عليك شخصياً، سنقوم بإخطارك فوراً وفقاً للمادة 20 من النظام. كما سنقوم بإخطار الجهة التنظيمية المختصة فور علمنا بأي خرق."
      },
      {
        "title": "10. بيانات القاصرين",
        "body": "منصتنا غير مخصصة للأفراد دون سن 18 عاماً. لا نجمع بيانات شخصية من القاصرين عن علم. إذا علمنا بأننا جمعنا بيانات من قاصر، سنتخذ خطوات فورية لحذفها."
      },
      {
        "title": "11. تحديثات السياسة",
        "body": "قد نحدّث سياسة الخصوصية هذه من وقت لآخر لتعكس التغييرات في ممارساتنا أو الأنظمة المعمول بها. سنخطرك بأي تغييرات جوهرية عبر التطبيق أو البريد الإلكتروني. تسري السياسة المحدثة من تاريخ نشرها."
      },
      {
        "title": "12. تواصل معنا",
        "body": "للاستفسارات أو الشكاوى أو لممارسة حقوقك في حماية البيانات:

• البريد الإلكتروني: privacy@hseeltech.com
• الهاتف: +966 XX XXX XXXX
• العنوان: الرياض، المملكة العربية السعودية

سنرد على طلبك خلال المدة المحددة في نظام حماية البيانات الشخصية ولوائحه التنفيذية."
      }
    ]
  }
};
