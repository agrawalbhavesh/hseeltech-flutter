import 'package:flutter/material.dart';
import 'package:hseeltech/utils/responsive.dart';
import 'package:hseeltech/utils/app_text_styles.dart';
import 'package:hseeltech/utils/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({Key? key}) : super(key: key);

  @override
  _KYCScreenState createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  int _step = 1;
  bool _completed = false;

  void _nextStep() {
    if (_step < 5) {
      setState(() {
        _step++;
      });
    } else {
      setState(() {
        _completed = true;
      });
    }
  }

  void _previousStep() {
    if (_step > 1) {
      setState(() {
        _step--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = Responsive(context);
    final styles = AppTextStyles(r);
    final spacing = AppSpacing(r);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(r, styles),
            if (!_completed)
              StepIndicator(current: _step, total: 5, r: r),
            Expanded(
              child: SingleChildScrollView(
                child: _buildStepContent(r, styles, spacing),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: !_completed ? _buildBottomBar(r, styles) : null,
    );
  }

  Widget _buildHeader(Responsive r, AppTextStyles styles) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: r.hp(2), horizontal: r.wp(5)),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B2A4A), Color(0xFF2E5090)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          r.verticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://files.manuscdn.com/user_upload_by_module/session_file/310519663327229615/QotVlztmCuPIBZGl.png',
                height: r.hp(3),
                opacity: const AlwaysStoppedAnimation(0.8),
              ),
              r.horizontalSpace(8),
              Text('KYC Questionnaire', style: styles.heading1.copyWith(color: Colors.white, fontSize: r.sp(17))),
            ],
          ),
          r.verticalSpace(4),
          Text(
            _completed ? 'Verification Complete' : 'Step $_step of 5',
            style: styles.body.copyWith(color: Colors.white54, fontSize: r.sp(11)),
          ),
           r.verticalSpace(10),
        ],
      ),
    );
  }

  Widget _buildStepContent(Responsive r, AppTextStyles styles, AppSpacing spacing) {
    if (_completed) {
      return _CompletionScreen(r: r, styles: styles, spacing: spacing);
    }
    switch (_step) {
      case 1:
        return _Step1(r: r, styles: styles, spacing: spacing);
      case 2:
        return _Step2(r: r, styles: styles, spacing: spacing);
      case 3:
        return _Step3(r: r, styles: styles, spacing: spacing);
      case 4:
        return _Step4(r: r, styles: styles, spacing: spacing);
      case 5:
        return _Step5(r: r, styles: styles, spacing: spacing);
      default:
        return Container();
    }
  }

  Widget _buildBottomBar(Responsive r, AppTextStyles styles) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: const Color(0xFFE2E8F0), width: 1.0)),
      ),
      child: Row(
        children: [
          if (_step > 1)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _previousStep,
                icon: Icon(Icons.arrow_back, size: r.icon(16), color: const Color(0xFF6B7280)),
                label: Text('Previous', style: styles.button.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(13))),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: r.hp(1.5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(r.radius(12)),
                  ),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
              ),
            ),
          if (_step > 1) r.horizontalSpace(12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _nextStep,
              icon: Icon(_step == 5 ? Icons.send : Icons.arrow_forward, size: r.icon(16), color: Colors.white),
              label: Text(_step == 5 ? 'Submit' : 'Next', style: styles.button.copyWith(color: Colors.white, fontSize: r.sp(13))),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: r.hp(1.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(r.radius(12)),
                ),
                backgroundColor: _step == 5 ? const Color(0xFF2D6A4F) : const Color(0xFF2E5090),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int current;
  final int total;
  final Responsive r;

  const StepIndicator({required this.current, required this.total, required this.r, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(6), vertical: r.hp(2)),
      child: Row(
        children: List.generate(total, (index) {
          final step = index + 1;
          final isDone = step < current;
          final isActive = step == current;
          return Expanded(
            child: Row(
              children: [
                Container(
                  width: r.wp(9),
                  height: r.wp(9),
                  decoration: BoxDecoration(
                    color: isDone ? const Color(0xFF2D6A4F) : isActive ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isDone
                        ? Icon(Icons.check, color: Colors.white, size: r.icon(16))
                        : Text(
                            '$step',
                            style: TextStyle(
                              color: isDone || isActive ? Colors.white : const Color(0xFF9CA3AF),
                              fontWeight: FontWeight.bold,
                              fontSize: r.sp(13),
                            ),
                          ),
                  ),
                ),
                if (step < total)
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: r.wp(1)),
                      height: 2,
                      color: isDone ? const Color(0xFF2D6A4F) : const Color(0xFFE2E8F0),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Responsive r;
  final AppTextStyles styles;

  const SectionTitle({required this.title, required this.r, required this.styles, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(left: r.wp(5), right: r.wp(5), bottom: r.hp(2)),
      padding: EdgeInsets.symmetric(vertical: r.hp(1.5), horizontal: r.wp(4)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2F9),
        borderRadius: BorderRadius.circular(r.radius(12)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: styles.body.copyWith(color: const Color(0xFF2E5090), fontWeight: FontWeight.bold, fontSize: r.sp(13)),
      ),
    );
  }
}

class _Step1 extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final AppSpacing spacing;

  const _Step1({required this.r, required this.styles, required this.spacing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5)).copyWith(bottom: r.hp(2)),
      child: Column(
        children: [
          SectionTitle(title: 'Customer Information', r: r, styles: styles),
          _InfoBanner(r: r, text: 'Fields marked with an icon are auto-filled from Nafath'),
          _InputField(r: r, styles: styles, label: 'Full Name', value: 'Mohammed Al-Rashidi', locked: true),
          _InputField(r: r, styles: styles, label: 'User Identity Number (National ID / Iqama)', value: '1098765432', locked: true),
          _SelectField(r: r, styles: styles, label: 'Nationality', value: 'Saudi'),
          _InputField(r: r, styles: styles, label: 'Email', placeholder: 'Enter your email'),
          _InputField(r: r, styles: styles, label: 'Phone Number', placeholder: '+966 5XX XXX XXXX'),
          _YesNoField(r: r, styles: styles, label: 'Do you have an alternate phone number?'),
          _SelectField(r: r, styles: styles, label: 'Education Level', placeholder: 'Select education level'),
          _SelectField(r: r, styles: styles, label: 'Primary Source of Income', placeholder: 'Select source'),
          _SelectField(r: r, styles: styles, label: 'Net Worth (SAR)', placeholder: 'Select range'),
          _SelectField(r: r, styles: styles, label: 'Annual Income (SAR)', placeholder: 'Select range'),
          _SelectField(r: r, styles: styles, label: 'Marital Status', placeholder: 'Select status'),
        ],
      ),
    );
  }
}

class _Step2 extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final AppSpacing spacing;

  const _Step2({required this.r, required this.styles, required this.spacing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5)).copyWith(bottom: r.hp(2)),
      child: Column(
        children: [
          SectionTitle(title: 'Address Information', r: r, styles: styles),
          _InfoBanner(r: r, text: 'Address may be pre-filled from Nafath records'),
          _InputField(r: r, styles: styles, label: 'Building Number', value: '4521', locked: true),
          _InputField(r: r, styles: styles, label: 'Street Name', placeholder: 'Enter street name'),
          _InputField(r: r, styles: styles, label: 'District', value: 'Al Olaya', locked: true),
          _InputField(r: r, styles: styles, label: 'City', value: 'Riyadh', locked: true),
          _SelectField(r: r, styles: styles, label: 'Region', value: 'Riyadh Region'),
          _InputField(r: r, styles: styles, label: 'Postal Code', value: '12244', locked: true),
          _InputField(r: r, styles: styles, label: 'Additional Number', placeholder: 'Optional'),
        ],
      ),
    );
  }
}

class _Step3 extends StatefulWidget {
  final Responsive r;
  final AppTextStyles styles;
  final AppSpacing spacing;

  const _Step3({required this.r, required this.styles, required this.spacing, Key? key}) : super(key: key);

  @override
  __Step3State createState() => __Step3State();
}

class __Step3State extends State<_Step3> {
  bool _notEmployed = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.r.wp(5)).copyWith(bottom: widget.r.hp(2)),
      child: Column(
        children: [
          SectionTitle(title: 'Employment Information', r: widget.r, styles: widget.styles),
          _InfoBanner(r: widget.r, text: 'Employment data may be pre-filled from Nafath'),
          GestureDetector(
            onTap: () => setState(() => _notEmployed = !_notEmployed),
            child: Container(
              margin: EdgeInsets.only(bottom: widget.r.hp(2.5)),
              padding: EdgeInsets.symmetric(horizontal: widget.r.wp(3), vertical: widget.r.hp(1.5)),
              decoration: BoxDecoration(
                color: _notEmployed ? const Color(0xFFEDF2F9) : const Color(0xFFF8FAFC),
                border: Border.all(color: _notEmployed ? const Color(0xFF2E5090) : const Color(0xFFE2E8F0), width: 1.5),
                borderRadius: BorderRadius.circular(widget.r.radius(12)),
              ),
              child: Row(
                children: [
                  Container(
                    width: widget.r.wp(5),
                    height: widget.r.wp(5),
                    decoration: BoxDecoration(
                      color: _notEmployed ? const Color(0xFF2E5090) : Colors.white,
                      border: _notEmployed ? null : Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                      borderRadius: BorderRadius.circular(widget.r.radius(6)),
                    ),
                    child: _notEmployed ? Icon(Icons.check, size: widget.r.icon(12), color: Colors.white) : null,
                  ),
                  widget.r.horizontalSpace(10),
                  Text('I am currently not employed', style: widget.styles.body.copyWith(color: _notEmployed ? const Color(0xFF2E5090) : const Color(0xFF6B7280), fontSize: widget.r.sp(12))),
                ],
              ),
            ),
          ),
          if (!_notEmployed)
            Column(
              children: [
                _InputField(r: widget.r, styles: widget.styles, label: 'Employer Name', placeholder: 'Enter employer name'),
                _InputField(r: widget.r, styles: widget.styles, label: 'Employer Address', placeholder: 'Enter employer address'),
                _InputField(r: widget.r, styles: widget.styles, label: 'Employer Phone', placeholder: 'Enter employer phone'),
                _InputField(r: widget.r, styles: widget.styles, label: 'Job Title', placeholder: 'Enter your job title'),
                _YesNoField(r: widget.r, styles: widget.styles, label: 'Are you currently employed?', defaultYes: true),
                _InputField(r: widget.r, styles: widget.styles, label: 'Service Duration', placeholder: 'e.g., 3 years'),
              ],
            ),
        ],
      ),
    );
  }
}

class _Step4 extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final AppSpacing spacing;

  const _Step4({required this.r, required this.styles, required this.spacing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5)).copyWith(bottom: r.hp(2)),
      child: Column(
        children: [
          SectionTitle(title: 'General Information', r: r, styles: styles),
          _YesNoField(r: r, styles: styles, label: 'Are you a Politically Exposed Person (PEP)?'),
          _YesNoField(r: r, styles: styles, label: 'Is the ultimate beneficiary a PEP?'),
          _YesNoField(r: r, styles: styles, label: 'Do you hold any other citizenship?'),
          _YesNoField(r: r, styles: styles, label: 'Do you have a Green Card?'),
          _YesNoField(r: r, styles: styles, label: 'Were you born in the USA?'),
          _YesNoField(r: r, styles: styles, label: 'Are you a US resident?'),
          _YesNoField(r: r, styles: styles, label: 'Do you have a US mailing address?'),
          _YesNoField(r: r, styles: styles, label: 'Do you have a US phone number?'),
        ],
      ),
    );
  }
}

class _Step5 extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final AppSpacing spacing;

  const _Step5({required this.r, required this.styles, required this.spacing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5)).copyWith(bottom: r.hp(2)),
      child: Column(
        children: [
          SectionTitle(title: 'Review & Submit', r: r, styles: styles),
          _ReviewSection(r: r, styles: styles, title: 'Customer Information', items: {
            'Full Name': 'Mohammed Al-Rashidi',
            'Identity Number': '1098765432',
            'Nationality': 'Saudi',
            'Email': 'm.alrashidi@example.com',
          }),
          _ReviewSection(r: r, styles: styles, title: 'Address Information', items: {
            'Building Number': '4521',
            'District': 'Al Olaya',
            'City': 'Riyadh',
            'Postal Code': '12244',
          }),
          _ReviewSection(r: r, styles: styles, title: 'Employment Information', items: {
            'Employer Name': 'ACME Corporation',
            'Job Title': 'Software Engineer',
          }),
          _ReviewSection(r: r, styles: styles, title: 'General Information', items: {
            'Is a PEP?': 'No',
            'Holds other citizenship?': 'No',
          }),
        ],
      ),
    );
  }
}

class _CompletionScreen extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final AppSpacing spacing;

  const _CompletionScreen({required this.r, required this.styles, required this.spacing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: r.wp(5), vertical: r.hp(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, color: const Color(0xFF2D6A4F), size: r.icon(80)),
          r.verticalSpace(16),
          Text('KYC Submitted Successfully', style: styles.heading2.copyWith(fontSize: r.sp(20)), textAlign: TextAlign.center),
          r.verticalSpace(8),
          Text(
            'Your information has been submitted and is under review. You will be notified once the verification is complete.',
            style: styles.body.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(14)),
            textAlign: TextAlign.center,
          ),
          r.verticalSpace(24),
          Container(
            padding: EdgeInsets.all(r.wp(4)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(r.radius(12)),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Submission Date', style: styles.body.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(12))),
                    Text('Feb 12, 2026', style: styles.body.copyWith(fontWeight: FontWeight.bold, fontSize: r.sp(12))),
                  ],
                ),
                r.verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status', style: styles.body.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(12))),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(0.5)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7ED),
                        borderRadius: BorderRadius.circular(r.radius(8)),
                      ),
                      child: Text('Pending Review', style: styles.body.copyWith(color: const Color(0xFFEA580C), fontWeight: FontWeight.bold, fontSize: r.sp(12))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          r.verticalSpace(24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.edit, size: r.icon(16), color: Colors.white),
            label: Text('Update Information', style: styles.button.copyWith(color: Colors.white, fontSize: r.sp(14))),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, r.hp(6)),
              backgroundColor: const Color(0xFF1B2A4A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(r.radius(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final String label;
  final String? value;
  final String? placeholder;
  final bool locked;

  const _InputField({
    required this.r,
    required this.styles,
    required this.label,
    this.value,
    this.placeholder,
    this.locked = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: r.hp(1.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: label,
              style: styles.body.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(11), fontWeight: FontWeight.w600),
              children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
            ),
          ),
          r.verticalSpace(6),
          TextFormField(
            initialValue: value,
            readOnly: locked,
            style: styles.body.copyWith(fontSize: r.sp(13), fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: styles.body.copyWith(fontSize: r.sp(13), color: const Color(0xFF9CA3AF)),
              filled: true,
              fillColor: locked ? const Color(0xFFF1F5F9) : Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: r.wp(3.5), vertical: r.hp(1.5)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(r.radius(12)),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(r.radius(12)),
                borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(r.radius(12)),
                borderSide: const BorderSide(color: Color(0xFF2E5090)),
              ),
              suffixIcon: locked ? Icon(Icons.lock, size: r.icon(14), color: const Color(0xFF9CA3AF)) : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectField extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final String label;
  final String? value;
  final String? placeholder;

  const _SelectField({
    required this.r,
    required this.styles,
    required this.label,
    this.value,
    this.placeholder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: r.hp(1.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: label,
              style: styles.body.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(11), fontWeight: FontWeight.w600),
              children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
            ),
          ),
          r.verticalSpace(6),
          Container(
            padding: EdgeInsets.symmetric(horizontal: r.wp(3.5), vertical: r.hp(1.5)),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(r.radius(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value ?? placeholder ?? 'Select...', style: styles.body.copyWith(fontSize: r.sp(13), color: value != null ? const Color(0xFF1B1B1B) : const Color(0xFF9CA3AF), fontWeight: FontWeight.w500)),
                Icon(Icons.keyboard_arrow_down, size: r.icon(20), color: const Color(0xFF9CA3AF)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _YesNoField extends StatefulWidget {
  final Responsive r;
  final AppTextStyles styles;
  final String label;
  final bool defaultYes;

  const _YesNoField({
    required this.r,
    required this.styles,
    required this.label,
    this.defaultYes = false,
    Key? key,
  }) : super(key: key);

  @override
  __YesNoFieldState createState() => __YesNoFieldState();
}

class __YesNoFieldState extends State<_YesNoField> {
  late bool _isYes;

  @override
  void initState() {
    super.initState();
    _isYes = widget.defaultYes;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: widget.r.hp(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: widget.label,
              style: widget.styles.body.copyWith(fontSize: widget.r.sp(12), fontWeight: FontWeight.w600),
              children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
            ),
          ),
          widget.r.verticalSpace(8),
          Row(
            children: [
              _buildOption(false),
              widget.r.horizontalSpace(12),
              _buildOption(true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(bool isYes) {
    final isSelected = _isYes == isYes;
    return GestureDetector(
      onTap: () => setState(() => _isYes = isYes),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: widget.r.wp(4), vertical: widget.r.hp(1)),
        decoration: BoxDecoration(
          color: isSelected ? (isYes ? const Color(0xFFFEF2F2) : const Color(0xFFE8F5E9)) : const Color(0xFFF8FAFC),
          border: Border.all(color: isSelected ? (isYes ? const Color(0xFFDC2626) : const Color(0xFF2D6A4F)) : const Color(0xFFE2E8F0), width: 1.5),
          borderRadius: BorderRadius.circular(widget.r.radius(12)),
        ),
        child: Row(
          children: [
            if (isSelected) Icon(Icons.check, size: widget.r.icon(14), color: isYes ? const Color(0xFFDC2626) : const Color(0xFF2D6A4F)),
            if (isSelected) widget.r.horizontalSpace(8),
            Text(
              isYes ? 'Yes' : 'No',
              style: widget.styles.body.copyWith(
                fontSize: r.sp(12),
                color: isSelected ? (isYes ? const Color(0xFFDC2626) : const Color(0xFF2D6A4F)) : const Color(0xFF9CA3AF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  final Responsive r;
  final String text;

  const _InfoBanner({required this.r, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(bottom: r.hp(2)),
      padding: EdgeInsets.symmetric(horizontal: r.wp(3), vertical: r.hp(1)),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        border: Border.all(color: const Color(0xFFFED7AA)),
        borderRadius: BorderRadius.circular(r.radius(8)),
      ),
      child: Row(
        children: [
          Icon(Icons.shield_outlined, size: r.icon(14), color: const Color(0xFFEA580C)),
          r.horizontalSpace(8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: r.sp(10), color: const Color(0xFF9A3412), fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewSection extends StatelessWidget {
  final Responsive r;
  final AppTextStyles styles;
  final String title;
  final Map<String, String> items;

  const _ReviewSection({
    required this.r,
    required this.styles,
    required this.title,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(bottom: r.hp(2)),
      padding: EdgeInsets.all(r.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(r.radius(12)),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: styles.body.copyWith(fontWeight: FontWeight.bold, fontSize: r.sp(14))),
              Icon(Icons.edit, size: r.icon(16), color: const Color(0xFF2E5090)),
            ],
          ),
          Divider(height: r.hp(2), thickness: 1, color: const Color(0xFFF1F5F9)),
          ...items.entries.map((e) => Padding(
                padding: EdgeInsets.symmetric(vertical: r.hp(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.key, style: styles.body.copyWith(color: const Color(0xFF6B7280), fontSize: r.sp(12))),
                    Text(e.value, style: styles.body.copyWith(fontWeight: FontWeight.w500, fontSize: r.sp(12))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
