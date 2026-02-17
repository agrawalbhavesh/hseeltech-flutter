// lib/features/property/detail/cubit/property_detail_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hseeltech/core/models/property.dart';
part 'property_detail_state.freezed.dart';

@freezed
class PropertyDetailState with _$PropertyDetailState {
  const factory PropertyDetailState.loading() = _Loading;
  const factory PropertyDetailState.loaded({
    required Property property,
    @Default(0) int selectedTab,
    @Default(0) int selectedImageIndex,
    @Default(false) bool isFavorited,
  }) = _Loaded;
  const factory PropertyDetailState.error(String message) = _Error;
}
