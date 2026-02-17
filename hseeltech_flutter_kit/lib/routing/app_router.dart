/// Hseeltech App Router Configuration
/// Uses GoRouter for declarative routing with deep linking support.
///
/// IMPORTANT: Replace placeholder widget references with actual screen widgets
/// as you build each screen.

// import 'package:go_router/go_router.dart';
// import 'package:flutter/material.dart';

/// Route path constants - use these instead of hardcoding strings
class AppRoutes {
  AppRoutes._();

  // Auth Flow
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String register = '/register';
  static const String nafath = '/nafath';
  static const String kyc = '/kyc';
  static const String pinSetup = '/pin-setup';
  static const String biometric = '/biometric';

  // Main Tabs (Shell Route)
  static const String home = '/';
  static const String explore = '/explore';
  static const String portfolio = '/portfolio';
  static const String rewards = '/rewards';
  static const String profile = '/profile';

  // Property & Investment
  static const String propertyDetail = '/property/:id';
  static const String invest = '/invest/:id';
  static const String investSuccess = '/invest-success';
  static const String investmentDetail = '/investment/:id';
  static const String completedReport = '/report/:id';

  // Wallet & Financial
  static const String wallet = '/wallet';
  static const String deposit = '/deposit';
  static const String withdraw = '/withdraw';
  static const String transactions = '/transactions';
  static const String bankAccount = '/bank-account';

  // Settings & Profile
  static const String settings = '/settings';
  static const String editProfile = '/edit-profile';
  static const String notifications = '/notifications';
  static const String savedProjects = '/saved';

  // Legal
  static const String terms = '/terms';
  static const String privacyPolicy = '/privacy';
  static const String riskDisclosure = '/risk';
  static const String faq = '/faq';
  static const String contactUs = '/contact';

  // Utility
  static const String deleteAccount = '/delete-account';

  /// Helper to build property detail route
  static String propertyDetailPath(String id) => '/property/$id';

  /// Helper to build invest route
  static String investPath(String id) => '/invest/$id';

  /// Helper to build investment detail route
  static String investmentDetailPath(String id) => '/investment/$id';

  /// Helper to build report route
  static String reportPath(String id) => '/report/$id';
}

/// Router configuration example (uncomment and adapt when implementing)
///
/// ```dart
/// final router = GoRouter(
///   initialLocation: AppRoutes.splash,
///   redirect: (context, state) {
///     // Check auth state and redirect accordingly
///     final isLoggedIn = /* check auth */;
///     final isAuthRoute = state.matchedLocation.startsWith('/splash') ||
///                         state.matchedLocation.startsWith('/welcome') ||
///                         state.matchedLocation.startsWith('/onboarding') ||
///                         state.matchedLocation.startsWith('/register');
///     if (!isLoggedIn && !isAuthRoute) return AppRoutes.welcome;
///     if (isLoggedIn && isAuthRoute) return AppRoutes.home;
///     return null;
///   },
///   routes: [
///     // Auth routes (no bottom nav)
///     GoRoute(path: AppRoutes.splash, builder: (_, __) => SplashScreen()),
///     GoRoute(path: AppRoutes.welcome, builder: (_, __) => WelcomeScreen()),
///     GoRoute(path: AppRoutes.onboarding, builder: (_, __) => OnboardingScreen()),
///     GoRoute(path: AppRoutes.register, builder: (_, __) => RegisterScreen()),
///     GoRoute(path: AppRoutes.nafath, builder: (_, __) => NafathScreen()),
///     GoRoute(path: AppRoutes.kyc, builder: (_, __) => KycScreen()),
///     GoRoute(path: AppRoutes.pinSetup, builder: (_, __) => PinSetupScreen()),
///     GoRoute(path: AppRoutes.biometric, builder: (_, __) => BiometricScreen()),
///
///     // Main shell with bottom navigation
///     ShellRoute(
///       builder: (_, __, child) => MainShell(child: child),
///       routes: [
///         GoRoute(path: AppRoutes.home, builder: (_, __) => HomeScreen()),
///         GoRoute(path: AppRoutes.explore, builder: (_, __) => ExploreScreen()),
///         GoRoute(path: AppRoutes.portfolio, builder: (_, __) => PortfolioScreen()),
///         GoRoute(path: AppRoutes.rewards, builder: (_, __) => RewardsScreen()),
///         GoRoute(path: AppRoutes.profile, builder: (_, __) => ProfileScreen()),
///       ],
///     ),
///
///     // Detail routes (no bottom nav, with back button)
///     GoRoute(path: AppRoutes.propertyDetail, builder: (_, state) =>
///       PropertyDetailScreen(id: state.pathParameters['id']!)),
///     GoRoute(path: AppRoutes.invest, builder: (_, state) =>
///       InvestScreen(propertyId: state.pathParameters['id']!)),
///     GoRoute(path: AppRoutes.investSuccess, builder: (_, __) => InvestSuccessScreen()),
///     // ... etc
///   ],
/// );
/// ```
