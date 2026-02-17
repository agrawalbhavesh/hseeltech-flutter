// lib/features/portfolio/report/cubit/report_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/investment_repository.dart';
import 'report_state.dart';

class CompletedReportCubit extends Cubit<CompletedReportState> {
  final InvestmentRepository _investRepo;

  CompletedReportCubit(this._investRepo) : super(const CompletedReportState.loading());

  Future<void> loadReport(String investmentId) async {
    try {
      final report = await _investRepo.getCompletedReport(investmentId);
      emit(CompletedReportState.loaded(
        propertyName: report.propertyName, investedAmount: report.investedAmount,
        returnAmount: report.returnAmount, returnPercentage: report.returnPercentage,
        startDate: report.startDate, endDate: report.endDate,
      ));
    } catch (e) {
      emit(CompletedReportState.error(e.toString()));
    }
  }
}
