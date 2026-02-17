// lib/features/settings/cubit/settings_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/services/storage_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final StorageService _storage;

  SettingsCubit(this._storage) : super(const SettingsState());

  Future<void> loadSettings() async {
    final info = await PackageInfo.fromPlatform();
    emit(SettingsState(
      notificationsEnabled: await _storage.getBool('notifications') ?? true,
      biometricEnabled: await _storage.getBool('biometric') ?? false,
      darkMode: await _storage.getBool('dark_mode') ?? false,
      language: await _storage.getString('language') ?? 'ar',
      appVersion: info.version,
    ));
  }

  Future<void> toggleNotifications(bool value) async {
    await _storage.setBool('notifications', value);
    emit(state.copyWith(notificationsEnabled: value));
  }

  Future<void> toggleBiometric(bool value) async {
    await _storage.setBool('biometric', value);
    emit(state.copyWith(biometricEnabled: value));
  }

  Future<void> toggleDarkMode(bool value) async {
    await _storage.setBool('dark_mode', value);
    emit(state.copyWith(darkMode: value));
  }

  Future<void> changeLanguage(String lang) async {
    await _storage.setString('language', lang);
    emit(state.copyWith(language: lang));
  }
}
