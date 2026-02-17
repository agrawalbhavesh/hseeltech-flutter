// lib/features/portfolio/report/cubit/report_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_state.freezed.dart';

@freezed
class CompletedReportState with _$CompletedReportState {
  const factory CompletedReportState.loading() = _Loading;
  const factory CompletedReportState.loaded({
    required String propertyName,
    required double investedAmount,
    required double returnAmount,
    required double returnPercentage,
    required DateTime startDate,
    required DateTime endDate,
  }) = _Loaded;
  const factory CompletedReportState.error(String message) = _Error;
}
