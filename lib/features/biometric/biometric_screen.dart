// Biometric Authentication Screen — Flutter Implementation
// ========================================================
// Uses local_auth package for fingerprint and Face ID.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BiometricAuthScreen extends StatefulWidget {
  @override
  State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics = [];
  bool _isAuthenticated = false;
  bool _isScanning = false;

  // Settings
  bool _fingerprintEnabled = true;
  bool _faceIdEnabled = false;
  bool _loginBiometric = true;
  bool _investBiometric = true;
  bool _withdrawBiometric = true;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    try {
      _canCheckBiometrics = await _localAuth.canCheckBiometrics;
      _availableBiometrics = await _localAuth.getAvailableBiometrics();
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint('Biometric check failed: \$e');
    }
  }

  Future<void> _authenticate() async {
    setState(() { _isScanning = true; _isAuthenticated = false; });
    
    try {
      final authenticated = await _localAuth.authenticate(
        localizedReason: 'Verify your identity to access Hseeltech',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      
      // Haptic feedback on result
      if (authenticated) {
        HapticFeedback.mediumImpact();
      } else {
        HapticFeedback.heavyImpact();
      }
      
      setState(() {
        _isAuthenticated = authenticated;
        _isScanning = false;
      });
    } on PlatformException catch (e) {
      setState(() { _isScanning = false; });
      debugPrint('Authentication failed: \$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Biometric Authentication',
            style: TextStyle(fontFamily: 'MontserratArabic', fontWeight: FontWeight.w700)),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Fingerprint'),
              Tab(text: 'Face ID'),
              Tab(text: 'Setup'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFingerprintTab(),
            _buildFaceIdTab(),
            _buildSetupTab(),
          ],
        ),
      ),
    );
  }

  // Build fingerprint, faceId, and setup tabs...
  // See mockup for detailed UI implementation.
}

// IMPORTANT: Add to pubspec.yaml:
// dependencies:
//   local_auth: ^2.1.0
//
// Android: Add to AndroidManifest.xml:
// <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
//
// iOS: Add to Info.plist:
// <key>NSFaceIDUsageDescription</key>
// <string>Hseeltech uses Face ID for secure authentication</string>
