// lib/features/profile/edit/cubit/edit_profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/user_repository.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository _userRepo;

  EditProfileCubit(this._userRepo) : super(const EditProfileState());

  void initFromProfile(String name, String email, String phone, String? avatar) {
    emit(state.copyWith(fullName: name, email: email, phone: phone, avatarPath: avatar));
  }

  void updateField(String field, String value) {
    switch (field) {
      case 'name': emit(state.copyWith(fullName: value, hasChanges: true));
      case 'email': emit(state.copyWith(email: value, hasChanges: true));
    }
  }

  void updateAvatar(String path) => emit(state.copyWith(avatarPath: path, hasChanges: true));

  Future<bool> saveProfile() async {
    emit(state.copyWith(isSubmitting: true));
    try {
      await _userRepo.updateProfile(fullName: state.fullName, email: state.email, avatar: state.avatarPath);
      emit(state.copyWith(isSubmitting: false, hasChanges: false));
      return true;
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
      return false;
    }
  }
}
