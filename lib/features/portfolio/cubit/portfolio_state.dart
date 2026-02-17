// lib/features/portfolio/cubit/portfolio_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/investment.dart';
part 'portfolio_state.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    @Default(true) bool isLoading,
    @Default([]) List<Investment> investments,
    @Default(0.0) double totalValue,
    @Default(0.0) double totalReturns,
    @Default(0.0) double returnsPercentage,
    @Default('all') String filter, // all, active, completed, pending
    String? errorMessage,
  }) = _PortfolioState;
}
