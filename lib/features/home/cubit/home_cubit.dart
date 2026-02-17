// lib/features/home/cubit/home_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/property_repository.dart';
import 'package:hseeltech/core/repositories/investment_repository.dart';
import 'package:hseeltech/core/repositories/wallet_repository.dart';
import 'package:hseeltech/core/repositories/notification_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PropertyRepository _propertyRepo;
  final InvestmentRepository _investRepo;
  final WalletRepository _walletRepo;
  final NotificationRepository _notifRepo;

  HomeCubit(this._propertyRepo, this._investRepo, this._walletRepo, this._notifRepo)
    : super(const HomeState());

  Future<void> loadDashboard() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final results = await Future.wait([
        _propertyRepo.getFeatured(),
        _investRepo.getActive(),
        _walletRepo.getBalance(),
        _notifRepo.getUnreadCount(),
      ]);
      emit(state.copyWith(
        isLoading: false,
        featuredProperties: results[0] as List<dynamic>,
        activeInvestments: results[1] as List<dynamic>,
        walletBalance: results[2] as double,
        unreadNotifications: results[3] as int,
        totalPortfolioValue: (results[1] as List).fold(0.0, (sum, inv) => sum + inv.currentValue),
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> refresh() => loadDashboard();
}
