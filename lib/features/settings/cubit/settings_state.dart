// lib/features/settings/cubit/settings_state.dart
class SettingsState {
  final bool notificationsEnabled;
  final bool biometricEnabled;
  final bool darkMode;
  final String language; // 'ar' or 'en'
  final String appVersion;

  const SettingsState({
    this.notificationsEnabled = true,
    this.biometricEnabled = false,
    this.darkMode = false,
    this.language = 'ar',
    this.appVersion = '',
  });

  SettingsState copyWith({bool? notificationsEnabled, bool? biometricEnabled, bool? darkMode, String? language}) =>
    SettingsState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      darkMode: darkMode ?? this.darkMode,
      language: language ?? this.language,
      appVersion: appVersion,
    );
}
