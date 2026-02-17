// lib/features/support/faq/cubit/faq_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(const FaqState());

  // FAQ data can be hardcoded or fetched from API
  void loadFaq() {
    // Load from local JSON or API
    emit(state.copyWith(isLoading: false));
  }

  void toggleExpanded(int index) {
    emit(state.copyWith(expandedIndex: state.expandedIndex == index ? -1 : index));
  }
}
