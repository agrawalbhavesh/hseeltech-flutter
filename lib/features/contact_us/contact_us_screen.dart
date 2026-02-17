import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Contact Us / Support Ticket Screen — Flutter Implementation
// Form-based screen for submitting support tickets
//
// Form Fields:
//   - Question Type: DropdownButtonFormField (General Inquiry, Technical Issue, Investments, Wallet, Account, Other)
//   - Subject: TextFormField (required)
//   - Description: TextFormField multiline (required)
//   - Full Name: TextFormField (pre-filled from user profile)
//   - Email: TextFormField with email validation (pre-filled from user profile)
//   - Phone: TextFormField (optional)
//
// Layout: Scrollable SingleChildScrollView with Form widget
// Header: AppBar with back arrow and 'Contact Us' / 'اتصل بنا' title
// Submit Button: Full-width ElevatedButton at bottom with loading state
//
// Validation:
//   - Subject: required, min 3 characters
//   - Description: required, min 10 characters
//   - Email: required, valid email format
//
// API: POST /api/support/tickets { type, subject, description, name, email, phone }
// Response: { ticketId, status: 'submitted' }
//
// Success State: Show confirmation dialog with ticket reference number
// then Navigator.pop() back to previous screen
//
// Navigation:
//   - Comes from: /more, /profile (Help), /faq, error states
//   - Goes to: Navigator.pop() (back to previous screen)
//
// Haptic: lightImpact on submit, mediumImpact on success
// Animation: Field focus border animation, submit button loading spinner, success checkmark

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _questionType = 'general';
  final _subjectCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool _isSubmitting = false;
  bool _isSuccess = false;
  String? _ticketId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // TODO: Implement full form UI with validation
    // TODO: Implement API call for ticket submission
    // TODO: Implement success state with ticket reference
    return Scaffold(
      appBar: AppBar(title: Text(l10n.contactUsTitle)),
      body: const Center(child: Text('Contact Us Form')),
    );
  }
}
