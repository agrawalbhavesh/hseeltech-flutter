// lib/features/support/faq/cubit/faq_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_state.freezed.dart';

@freezed
class FaqState with _$FaqState {
  const factory FaqState({
    @Default(true) bool isLoading,
    @Default([]) List<FaqCategory> categories,
    @Default(-1) int expandedIndex,
    String? errorMessage,
  }) = _FaqState;
}

class FaqCategory {
  final String title;
  final List<FaqItem> items;
  FaqCategory({required this.title, required this.items});
}

class FaqItem {
  final String question;
  final String answer;
  FaqItem({required this.question, required this.answer});
}
