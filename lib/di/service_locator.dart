// ============================================
// Service Locator - lib/core/di/service_locator.dart
// ============================================
// Using get_it for dependency injection

import 'package:get_it/get_it.dart';
import '../network/api_client.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/user_repository.dart';
import '../../repositories/kyc_repository.dart';
import '../../repositories/property_repository.dart';
import '../../repositories/investment_repository.dart';
import '../../repositories/wallet_repository.dart';
import '../../repositories/notification_repository.dart';
import '../../repositories/referral_repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<KycRepository>(
    () => KycRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<PropertyRepository>(
    () => PropertyRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<InvestmentRepository>(
    () => InvestmentRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<WalletRepository>(
    () => WalletRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ReferralRepository>(
    () => ReferralRepository(getIt<ApiClient>()),
  );
}

// Usage in main.dart:
// void main() {
//   setupServiceLocator();
//   runApp(const HseelTechApp());
// }
//
// Usage in any screen:
// final propertyRepo = getIt<PropertyRepository>();
// final result = await propertyRepo.getProperties();
