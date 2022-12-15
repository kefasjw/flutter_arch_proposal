import 'dart:async';

import 'package:flutter_arch_proposal/core/data/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginScreenUiState> {
  LoginViewModel(this._authRepository) : super(const LoginScreenUiState());

  StreamSubscription? _subscription;

  static final provider =
      StateNotifierProvider.autoDispose<LoginViewModel, LoginScreenUiState>(
          (ref) {
    return LoginViewModel(ref.watch(AuthRepository.provider));
  });

  final AuthRepository _authRepository;

  void onScreenLoaded() {
    _subscription?.cancel();
    _subscription = _authRepository.isLoggedInStream.listen((event) {
      state = state.copyWith(isLoggedIn: event);
    });
  }

  Future<void> onLoginButtonPressed() async {
    state = state.copyWith(isLoading: true);
    await _authRepository.login();
    if (!mounted) return;
    state = state.copyWith(isLoading: false);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

class LoginScreenUiState {
  const LoginScreenUiState({
    this.isLoading = false,
    this.isLoggedIn = false,
  });

  final bool isLoading;

  final bool isLoggedIn;

  LoginScreenUiState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
  }) {
    return LoginScreenUiState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
