// lib/features/property/detail/cubit/property_detail_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/property_repository.dart';
import 'property_detail_state.dart';

class PropertyDetailCubit extends Cubit<PropertyDetailState> {
  final PropertyRepository _propertyRepo;

  PropertyDetailCubit(this._propertyRepo) : super(const PropertyDetailState.loading());

  Future<void> loadProperty(String propertyId) async {
    emit(const PropertyDetailState.loading());
    try {
      final property = await _propertyRepo.getById(propertyId);
      emit(PropertyDetailState.loaded(property: property));
    } catch (e) {
      emit(PropertyDetailState.error(e.toString()));
    }
  }

  void selectTab(int index) {
    final s = state;
    if (s is _Loaded) emit(s.copyWith(selectedTab: index));
  }

  void selectImage(int index) {
    final s = state;
    if (s is _Loaded) emit(s.copyWith(selectedImageIndex: index));
  }

  Future<void> toggleFavorite() async {
    final s = state;
    if (s is _Loaded) {
      emit(s.copyWith(isFavorited: !s.isFavorited));
      await _propertyRepo.toggleFavorite(s.property.id);
    }
  }
}
