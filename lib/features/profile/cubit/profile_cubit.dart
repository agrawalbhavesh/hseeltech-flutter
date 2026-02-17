// lib/features/profile/cubit/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hseeltech/core/repositories/user_repository.dart';
import 'package:hseeltech/core/repositories/auth_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepo;
  final AuthRepository _authRepo;

  ProfileCubit(this._userRepo, this._authRepo) : super(const ProfileState());

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await _userRepo.getProfile();
      emit(state.copyWith(isLoading: false, user: user, kycStatus: user.kycStatus,
        totalInvestments: user.totalInvestments, totalInvested: user.totalInvested));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    await _authRepo.logout();
  }
}
