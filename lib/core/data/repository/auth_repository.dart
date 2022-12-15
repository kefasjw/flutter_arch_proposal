import 'dart:async';

import 'package:flutter_arch_proposal/core/shared_preferences/app_preferences_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository(this._appPreferencesDataSource);

  static final provider = Provider(
    (ref) => AuthRepository(ref.watch(AppPreferencesDataSource.provider)),
  );

  final AppPreferencesDataSource _appPreferencesDataSource;

  final _isLoggedInStream = StreamController<bool>();

  late Stream<bool> isLoggedInStream =
      _isLoggedInStream.stream.asBroadcastStream();

  var _isLoggedInCache = false;

  Future<bool> isLoggedIn() async {
    return _isLoggedInCache;
  }

  Future<String> getLastUsername() async {
    return _appPreferencesDataSource.getUsername();
  }

  Future<void> login({
    required String username,
    required String password,
    required bool shouldSaveUsername,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    if (shouldSaveUsername && username.isNotEmpty) {
      await _appPreferencesDataSource.setUsername(username);
    } else {
      await _appPreferencesDataSource.setUsername('');
    }
    _updateLoginState(true);
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    _updateLoginState(false);
  }

  void _updateLoginState(bool isLoggedIn) {
    _isLoggedInStream.add(isLoggedIn);
    _isLoggedInCache = isLoggedIn;
  }
}
