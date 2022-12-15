import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  static final provider = Provider((ref) => AuthRepository());

  final _isLoggedInStream = StreamController<bool>();

  late Stream<bool> isLoggedInStream =
      _isLoggedInStream.stream.asBroadcastStream();

  var _isLoggedInCache = false;

  Future<bool> isLoggedIn() async {
    return _isLoggedInCache;
  }

  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
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
