// lib/features/splash/cubit/splash_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/auth_repository.dart';
import 'package:hseeltech/core/services/storage_service.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository _authRepo;
  final StorageService _storage;

  SplashCubit(this._authRepo, this._storage) : super(const SplashState.initial());

  Future<void> initialize() async {
    emit(const SplashState.loading());
    try {
      // Check if onboarding completed
      final onboarded = await _storage.getBool('onboarding_completed');
      if (onboarded != true) {
        emit(const SplashState.onboardingRequired());
        return;
      }
      // Check auth token
      final token = await _storage.getString('auth_token');
      if (token == null) {
        emit(const SplashState.unauthenticated());
        return;
      }
      // Validate token with server
      final isValid = await _authRepo.validateToken();
      if (isValid) {
        emit(const SplashState.authenticated());
      } else {
        await _storage.remove('auth_token');
        emit(const SplashState.unauthenticated());
      }
    } catch (e) {
      emit(SplashState.error(e.toString()));
    }
  }
}
