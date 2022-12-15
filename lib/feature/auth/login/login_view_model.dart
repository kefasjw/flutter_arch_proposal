import 'dart:async';

import 'package:flutter_arch_proposal/core/data/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_view_model.freezed.dart';

class LoginViewModel extends StateNotifier<LoginScreenUiState> {
  LoginViewModel(this._authRepository) : super(const LoginScreenUiState());

  StreamSubscription? _isLoggedInSubscription;

  Timer? _usernameDebounce;

  Timer? _passwordDebounce;

  static final provider =
      StateNotifierProvider.autoDispose<LoginViewModel, LoginScreenUiState>(
          (ref) {
    return LoginViewModel(ref.watch(AuthRepository.provider));
  });

  final AuthRepository _authRepository;

  void onScreenLoaded() {
    _isLoggedInSubscription?.cancel();
    _isLoggedInSubscription = _authRepository.isLoggedInStream.listen((event) {
      state = state.copyWith(isLoggedIn: event);
    });
    _getSavedUsername();
  }

  Future<void> _getSavedUsername() async {
    final username = await _authRepository.getLastUsername();
    if (!mounted) return;
    if (username.isNotEmpty) {
      state = state.copyWith(
        username: username,
        shouldSaveUsername: true,
      );
      _validateUsername(showError: true);
      _checkLoginButtonEnabled();
    }
  }

  void onUsernameChanged(String username) {
    state = state.copyWith(username: username);
    _checkLoginButtonEnabled();
    _usernameDebounce?.cancel();
    _usernameDebounce = Timer(
      const Duration(milliseconds: 300),
      () {
        _validateUsername(showError: true);
      },
    );
  }

  bool _validateUsername({required bool showError}) {
    final String? error;
    if (state.username.length < 3) {
      error = 'Min 3 characters';
    } else {
      error = null;
    }
    if (showError) state = state.copyWith(usernameError: error);
    return error == null;
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
    _checkLoginButtonEnabled();
    _passwordDebounce?.cancel();
    _passwordDebounce = Timer(
      const Duration(milliseconds: 300),
      () {
        _validatePassword(showError: true);
      },
    );
  }

  bool _validatePassword({required bool showError}) {
    final String? error;
    if (state.password.isEmpty) {
      error = 'Must not be empty';
    } else {
      error = null;
    }
    if (showError) state = state.copyWith(passwordError: error);
    return error == null;
  }

  bool _checkLoginButtonEnabled() {
    final isEnabled = _validateUsername(showError: false) &&
        _validatePassword(showError: false);
    state = state.copyWith(isLoginButtonEnabled: isEnabled);
    return isEnabled;
  }

  void onShouldSaveUsernameToggled() {
    state = state.copyWith(shouldSaveUsername: !state.shouldSaveUsername);
  }

  Future<void> onLoginButtonPressed() async {
    if (!_checkLoginButtonEnabled()) return;
    state = state.copyWith(isLoading: true);
    await _authRepository.login(
      username: state.username,
      password: state.password,
      shouldSaveUsername: state.shouldSaveUsername,
    );
    if (!mounted) return;
    state = state.copyWith(isLoading: false);
  }

  @override
  void dispose() {
    _isLoggedInSubscription?.cancel();
    _usernameDebounce?.cancel();
    _passwordDebounce?.cancel();
    super.dispose();
  }
}

@freezed
class LoginScreenUiState with _$LoginScreenUiState {
  const factory LoginScreenUiState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedIn,
    @Default('') String username,
    String? usernameError,
    @Default('') String password,
    String? passwordError,
    @Default(false) bool shouldSaveUsername,
    @Default(false) bool isLoginButtonEnabled,
  }) = _LoginScreenUiState;
}
