// lib/features/portfolio/detail/cubit/investment_detail_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/investment_repository.dart';
import 'investment_detail_state.dart';

class InvestmentDetailCubit extends Cubit<InvestmentDetailState> {
  final InvestmentRepository _investRepo;

  InvestmentDetailCubit(this._investRepo) : super(const InvestmentDetailState.loading());

  Future<void> load(String investmentId) async {
    emit(const InvestmentDetailState.loading());
    try {
      final investment = await _investRepo.getById(investmentId);
      emit(InvestmentDetailState.loaded(investment: investment));
    } catch (e) {
      emit(InvestmentDetailState.error(e.toString()));
    }
  }
}
