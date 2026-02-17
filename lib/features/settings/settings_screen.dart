import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _investAlerts = true;
  bool _returnAlerts = true;
  bool _biometric = true;
  bool _darkMode = false;
  bool _showBalance = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Color(0xFF1B2A4A), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection('LANGUAGE & REGION', [
            _buildSettingRow(Icons.language, 'App Language', value: 'English', hasArrow: true),
          ]),
          const SizedBox(height: 12),
          _buildSection('NOTIFICATIONS', [
            _buildToggleRow(Icons.notifications, 'Push Notifications', _pushNotifications, (v) => setState(() => _pushNotifications = v)),
            _buildToggleRow(Icons.phone_android, 'New Investment Alerts', _investAlerts, (v) => setState(() => _investAlerts = v)),
            _buildToggleRow(Icons.notifications_active, 'Return Distribution Alerts', _returnAlerts, (v) => setState(() => _returnAlerts = v)),
          ]),
          const SizedBox(height: 12),
          _buildSection('SECURITY', [
            _buildToggleRow(Icons.fingerprint, 'Biometric Login', _biometric, (v) => setState(() => _biometric = v)),
            _buildSettingRow(Icons.lock, 'Change PIN', hasArrow: true),
            _buildToggleRow(Icons.visibility, 'Show Balance on Home', _showBalance, (v) => setState(() => _showBalance = v)),
          ]),
          const SizedBox(height: 12),
          _buildSection('APPEARANCE', [
            _buildToggleRow(Icons.dark_mode, 'Dark Mode', _darkMode, (v) => setState(() => _darkMode = v)),
          ]),
          const SizedBox(height: 12),
          _buildSection('ACCOUNT', [
            _buildSettingRow(Icons.shield, 'Privacy Policy', hasArrow: true),
            _buildSettingRow(Icons.logout, 'Sign Out', danger: true),
            _buildSettingRow(Icons.delete, 'Delete Account', danger: true),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF9CA3AF), letterSpacing: 1.2)),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildSettingRow(IconData icon, String label, {String? value, bool hasArrow = false, bool danger = false}) {
    return ListTile(
      leading: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(color: danger ? const Color(0xFFFEE2E2) : const Color(0xFFEDF2F9), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, size: 16, color: danger ? Colors.red : const Color(0xFF2E5090)),
      ),
      title: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: danger ? Colors.red : const Color(0xFF1B1B1B))),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        if (value != null) Text(value, style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
        if (hasArrow) const Icon(Icons.chevron_right, size: 16, color: Color(0xFF9CA3AF)),
      ]),
    );
  }

  Widget _buildToggleRow(IconData icon, String label, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      leading: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(color: const Color(0xFFEDF2F9), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, size: 16, color: const Color(0xFF2E5090)),
      ),
      title: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      trailing: Switch(value: value, onChanged: onChanged, activeColor: const Color(0xFF2D6A4F)),
    );
  }
}
