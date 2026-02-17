// lib/features/portfolio/detail/cubit/investment_detail_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/investment.dart';
part 'investment_detail_state.freezed.dart';

@freezed
class InvestmentDetailState with _$InvestmentDetailState {
  const factory InvestmentDetailState.loading() = _Loading;
  const factory InvestmentDetailState.loaded({required Investment investment}) = _Loaded;
  const factory InvestmentDetailState.error(String message) = _Error;
}
