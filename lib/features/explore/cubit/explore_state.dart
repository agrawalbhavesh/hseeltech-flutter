// lib/features/explore/cubit/explore_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/property.dart';
part 'explore_state.freezed.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState({
    @Default(true) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default([]) List<Property> properties,
    @Default('') String searchQuery,
    @Default(null) String? selectedCity,
    @Default(null) String? selectedType,
    @Default(null) double? minPrice,
    @Default(null) double? maxPrice,
    @Default('newest') String sortBy,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    String? errorMessage,
  }) = _ExploreState;
}
