import 'dart:async';

import 'package:auth_data/auth_data.dart';
import 'package:core/core.dart';
import 'package:shared_dependency/flutter_riverpod.dart';
import 'package:shared_dependency/freezed_annotation.dart';

part 'login_controller.freezed.dart';

class LoginController extends StateNotifier<LoginScreenUiState> {
  LoginController(
    this._authRepository,
    this._commonController,
  ) : super(const LoginScreenUiState());

  static final provider =
      StateNotifierProvider.autoDispose<LoginController, LoginScreenUiState>(
          (ref) {
    return LoginController(
      ref.watch(AuthRepository.provider),
      ref.watch(CommonController.provider.notifier),
    );
  });

  final AuthRepository _authRepository;

  final CommonController _commonController;

  StreamSubscription? _isLoggedInSubscription;

  Timer? _usernameDebounce;

  Timer? _passwordDebounce;

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
    final UiText error;
    if (state.username.length < 3) {
      error = UiText.localized(
        (localizations) => localizations.usernameMinCharacters,
      );
    } else {
      error = UiText.empty;
    }
    if (showError) state = state.copyWith(usernameError: error);
    return error == UiText.empty;
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
    final UiText error;
    if (state.password.isEmpty) {
      error = UiText.localized(
        (localizations) => localizations.passwordMustNotEmpty,
      );
    } else {
      error = UiText.empty;
    }
    if (showError) state = state.copyWith(passwordError: error);
    return error == UiText.empty;
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
    _commonController.showLoading(isLoading: true);
    final result = await AsyncValue.guard(
      () => _authRepository.login(
        username: state.username,
        password: state.password,
        shouldSaveUsername: state.shouldSaveUsername,
      ),
    );
    if (result is AsyncError) {
      _commonController.handleCommonError(result.error);
    }
    if (!mounted) return;
    _commonController.showLoading(isLoading: false);
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
    @Default(false) bool isLoggedIn,
    @Default('') String username,
    @Default(UiText.empty) UiText usernameError,
    @Default('') String password,
    @Default(UiText.empty) UiText passwordError,
    @Default(false) bool shouldSaveUsername,
    @Default(false) bool isLoginButtonEnabled,
  }) = _LoginScreenUiState;
}
