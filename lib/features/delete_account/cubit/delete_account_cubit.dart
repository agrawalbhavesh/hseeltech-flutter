// lib/features/account/cubit/delete_account_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/account_repository.dart';
import 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final AccountRepository _repo;
  DeleteAccountCubit(this._repo) : super(const DeleteAccountState.initial());

  void startDeletion() => emit(const DeleteAccountState.confirming());
  void proceedToPin() => emit(const DeleteAccountState.verifyingPin());

  Future<void> verifyPinAndDelete(String pin) async {
    emit(const DeleteAccountState.deleting());
    final result = await _repo.deleteAccount(pin);
    result.when(
      success: (_) => emit(const DeleteAccountState.deleted()),
      failure: (msg) => emit(DeleteAccountState.pinError(msg)),
    );
  }
}
