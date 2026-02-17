// lib/features/portfolio/cubit/portfolio_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/investment_repository.dart';
import 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final InvestmentRepository _investRepo;

  PortfolioCubit(this._investRepo) : super(const PortfolioState());

  Future<void> loadPortfolio() async {
    emit(state.copyWith(isLoading: true));
    try {
      final investments = await _investRepo.getMyInvestments();
      final total = investments.fold(0.0, (sum, i) => sum + i.currentValue);
      final returns = investments.fold(0.0, (sum, i) => sum + i.returns);
      emit(state.copyWith(
        isLoading: false,
        investments: investments,
        totalValue: total,
        totalReturns: returns,
        returnsPercentage: total > 0 ? (returns / total) * 100 : 0,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void updateFilter(String filter) {
    emit(state.copyWith(filter: filter));
  }

  List<dynamic> get filteredInvestments {
    if (state.filter == 'all') return state.investments;
    return state.investments.where((i) => i.status == state.filter).toList();
  }
}
