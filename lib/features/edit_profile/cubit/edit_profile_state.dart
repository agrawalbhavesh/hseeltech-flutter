// lib/features/profile/edit/cubit/edit_profile_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @Default(null) String? avatarPath,
    @Default(false) bool isSubmitting,
    @Default(false) bool hasChanges,
    String? errorMessage,
  }) = _EditProfileState;
}
