// lib/features/favorites/cubit/favorites_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/favorites_repository.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _repo;
  FavoritesCubit(this._repo) : super(const FavoritesState.initial());

  Future<void> loadFavorites() async {
    emit(const FavoritesState.loading());
    final result = await _repo.getFavorites();
    result.when(
      success: (data) => emit(FavoritesState.loaded(data)),
      failure: (msg) => emit(FavoritesState.error(msg)),
    );
  }

  Future<void> toggleFavorite(String opportunityId) async {
    final current = state.maybeWhen(loaded: (f) => f, orElse: () => <Opportunity>[]);
    final isFav = current.any((o) => o.id == opportunityId);
    if (isFav) {
      await _repo.removeFavorite(opportunityId);
    } else {
      await _repo.addFavorite(opportunityId);
    }
    loadFavorites();
  }
}
