import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/snackbar_message.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/use_case/auth_usecase.dart';
import '../state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref.read(authUseCaseProvider));
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;
  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  // for user register
  Future<void> registerUser(UserEntity user, BuildContext context) async {
    // load the progress bar
    state = state.copyWith(isLoading: true);
    // get the response from the use case/server
    Either<Failure, bool> data = await _authUseCase.registerUser(user);

    data.fold((failed) {
      state = state.copyWith(isLoading: false, error: failed.error);
      showSnackbarMsg(
        context: context,
        targetMessage: failed.error,
        targetTitle: 'Error',
        type: ContentType.failure,
      );
    }, (success) {
      state = state.copyWith(isLoading: false, error: null);
    });
  }
}
