import 'dart:async';

import 'package:auth_data/src/data/network/auth_network_data_source.dart';
import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';

class AuthRepository {
  AuthRepository(
    this._authNetworkDataSource,
    this._appPreferencesDataSource,
    this._appSecureStorageDataSource,
  );

  static final provider = Provider(
    (ref) => AuthRepository(
      ref.watch(AuthNetworkDataSource.provider),
      ref.watch(AppPreferencesDataSource.provider),
      ref.watch(AppSecureStorageDataSource.provider),
    ),
  );

  final AuthNetworkDataSource _authNetworkDataSource;

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
    final token = await _authNetworkDataSource.login();
    if (token.isEmpty) throw Exception('Empty token');
    if (shouldSaveUsername && username.isNotEmpty) {
      await _appPreferencesDataSource.setUsername(username);
    } else {
      await _appPreferencesDataSource.setUsername('');
    }
    await _appSecureStorageDataSource.setToken(token);
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
    await _appSecureStorageDataSource.setToken('');
  }
}
