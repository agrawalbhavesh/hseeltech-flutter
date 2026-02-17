// lib/features/home/cubit/home_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/property.dart';
import 'package:hseeltech/core/models/investment.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    @Default([]) List<Property> featuredProperties,
    @Default([]) List<Investment> activeInvestments,
    @Default(0.0) double totalPortfolioValue,
    @Default(0.0) double walletBalance,
    @Default(0) int unreadNotifications,
    String? greeting,
    String? errorMessage,
  }) = _HomeState;
}
