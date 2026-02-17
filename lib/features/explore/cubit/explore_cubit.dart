// lib/features/explore/cubit/explore_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/property_repository.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final PropertyRepository _propertyRepo;

  ExploreCubit(this._propertyRepo) : super(const ExploreState());

  Future<void> loadProperties({bool refresh = false}) async {
    if (refresh) emit(state.copyWith(currentPage: 1, isLoading: true));
    else emit(state.copyWith(isLoading: state.properties.isEmpty));
    try {
      final result = await _propertyRepo.getAll(
        page: state.currentPage,
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        city: state.selectedCity,
        type: state.selectedType,
        minPrice: state.minPrice,
        maxPrice: state.maxPrice,
        sortBy: state.sortBy,
      );
      emit(state.copyWith(
        isLoading: false,
        properties: refresh ? result.items : [...state.properties, ...result.items],
        hasMore: result.hasMore,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void updateSearch(String query) { emit(state.copyWith(searchQuery: query)); loadProperties(refresh: true); }
  void updateCity(String? city) { emit(state.copyWith(selectedCity: city)); loadProperties(refresh: true); }
  void updateSort(String sort) { emit(state.copyWith(sortBy: sort)); loadProperties(refresh: true); }
  void loadMore() { emit(state.copyWith(currentPage: state.currentPage + 1, isLoadingMore: true)); loadProperties(); }
}
