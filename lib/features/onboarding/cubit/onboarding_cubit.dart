// lib/features/onboarding/cubit/onboarding_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/services/storage_service.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final StorageService _storage;

  OnboardingCubit(this._storage) : super(const OnboardingState());

  void onPageChanged(int page) {
    emit(state.copyWith(
      currentPage: page,
      isLastPage: page == state.totalPages - 1,
    ));
  }

  Future<void> completeOnboarding() async {
    await _storage.setBool('onboarding_completed', true);
  }

  Future<void> skip() async {
    await completeOnboarding();
  }
}
