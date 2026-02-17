// lib/features/splash/cubit/splash_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading() = _Loading;
  const factory SplashState.authenticated() = _Authenticated;
  const factory SplashState.unauthenticated() = _Unauthenticated;
  const factory SplashState.onboardingRequired() = _OnboardingRequired;
  const factory SplashState.updateRequired({required String storeUrl}) = _UpdateRequired;
  const factory SplashState.error(String message) = _Error;
}
