import 'dart:async';

import 'package:core/src/secure_storage/di/secure_storage_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _tokenKey = 'tk';

class AppSecureStorageDataSource {
  AppSecureStorageDataSource(this._secureStorage);

  static final provider = Provider(
    (ref) {
      return AppSecureStorageDataSource(ref.watch(secureStorageProvider));
    },
  );

  final FlutterSecureStorage _secureStorage;

  final StreamController<String> _tokenStreamController =
      StreamController.broadcast();

  Future<String> getToken() async {
    return (await _secureStorage.read(key: _tokenKey)) ?? '';
  }

  Stream<String> getTokenStream() {
    return _tokenStreamController.stream;
  }

  Future<void> setToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
    _tokenStreamController.add(token);
  }
}
