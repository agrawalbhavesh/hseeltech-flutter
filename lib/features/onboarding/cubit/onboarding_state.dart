// lib/features/onboarding/cubit/onboarding_state.dart
class OnboardingState {
  final int currentPage;
  final bool isLastPage;
  final int totalPages;

  const OnboardingState({
    this.currentPage = 0,
    this.isLastPage = false,
    this.totalPages = 3,
  });

  OnboardingState copyWith({int? currentPage, bool? isLastPage}) =>
    OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      totalPages: totalPages,
    );
}
