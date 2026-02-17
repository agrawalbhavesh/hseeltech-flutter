// lib/features/favorites/cubit/favorites_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/opportunity.dart';
part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.loaded(List<Opportunity> favorites) = _Loaded;
  const factory FavoritesState.error(String message) = _Error;
}
