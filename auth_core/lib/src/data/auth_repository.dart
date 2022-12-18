import 'dart:async';

import 'package:core/core.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository(
    this._appPreferencesDataSource,
    this._appSecureStorageDataSource,
  );

  static final provider = Provider(
    (ref) => AuthRepository(
      ref.watch(AppPreferencesDataSource.provider),
      ref.watch(AppSecureStorageDataSource.provider),
    ),
  );

  final AppPreferencesDataSource _appPreferencesDataSource;

  final AppSecureStorageDataSource _appSecureStorageDataSource;

  late Stream<bool> isLoggedInStream = _appSecureStorageDataSource
      .getTokenStream()
      .map((event) => event.isNotEmpty);

  Future<bool> isLoggedIn() async {
    return (await _appSecureStorageDataSource.getToken()).isNotEmpty;
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
    await _appSecureStorageDataSource.setToken('dummy token');
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    await _appSecureStorageDataSource.setToken('');
  }
}
