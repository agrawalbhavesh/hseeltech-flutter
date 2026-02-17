import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController(text: 'Mohammed Al-Rashidi');
  final _emailCtrl = TextEditingController(text: 'mohammed@email.com');
  final _phoneCtrl = TextEditingController(text: '+966 55 123 4567');
  final _idCtrl = TextEditingController(text: '1098765432');
  DateTime _dob = DateTime(1995, 6, 15);
  String _nationality = 'Saudi';
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final r = ScreenUtil();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Profile',
          style: TextStyle(fontFamily: 'MontserratArabic', fontWeight: FontWeight.w700,
            fontSize: r.sp(16), color: const Color(0xFF1B2A4A))),
        backgroundColor: Colors.white, elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1B2A4A)),
          onPressed: () => Navigator.pop(context)),
        actions: [
          TextButton(
            onPressed: _saving ? null : _saveProfile,
            child: Text('Save', style: TextStyle(fontFamily: 'MontserratArabic',
              fontWeight: FontWeight.w700, fontSize: r.sp(14), color: const Color(0xFF2E5090)))),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(r.w(20)), children: [
          Center(child: Stack(children: [
            CircleAvatar(radius: r.w(45), backgroundColor: const Color(0xFFEDF2F9),
              child: Icon(Icons.person, size: r.w(40), color: const Color(0xFF2E5090))),
            Positioned(bottom: 0, right: 0, child: Container(
              padding: EdgeInsets.all(r.w(6)),
              decoration: const BoxDecoration(color: Color(0xFF2E5090), shape: BoxShape.circle),
              child: Icon(Icons.camera_alt, size: r.w(14), color: Colors.white))),
          ])),
          SizedBox(height: r.h(24)),
          _buildField(r, 'Full Name', _nameCtrl, Icons.person_outline),
          _buildField(r, 'Email', _emailCtrl, Icons.email_outlined,
            keyboardType: TextInputType.emailAddress),
          _buildField(r, 'Phone', _phoneCtrl, Icons.phone_outlined,
            keyboardType: TextInputType.phone),
          _buildField(r, 'National ID', _idCtrl, Icons.badge_outlined,
            keyboardType: TextInputType.number),
          _buildDateField(r),
          _buildNationalityField(r),
        ]),
      ),
    );
  }

  Widget _buildField(ScreenUtil r, String label, TextEditingController ctrl,
      IconData icon, {TextInputType? keyboardType}) {
    return Padding(
      padding: EdgeInsets.only(bottom: r.h(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(fontFamily: 'MontserratArabic',
          fontWeight: FontWeight.w600, fontSize: r.sp(11), color: const Color(0xFF6B7280))),
        SizedBox(height: r.h(6)),
        TextFormField(
          controller: ctrl, keyboardType: keyboardType,
          style: TextStyle(fontFamily: 'MontserratArabic', fontWeight: FontWeight.w500,
            fontSize: r.sp(13), color: const Color(0xFF1B2A4A)),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xFF2E5090), size: r.w(18)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(r.r(12)),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(r.r(12)),
              borderSide: const BorderSide(color: Color(0xFF2E5090), width: 2)),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
      ]),
    );
  }

  Widget _buildDateField(ScreenUtil r) { return const SizedBox(); }
  Widget _buildNationalityField(ScreenUtil r) { return const SizedBox(); }
  Future<void> _saveProfile() async { /* API call */ }
}
