import 'package:flutter_arch_proposal/core/shared_preferences/di/shared_preferences_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _usernameKey = 'USERNAME';

class AppPreferencesDataSource {
  AppPreferencesDataSource(this._prefs);

  static final provider = Provider((ref) {
    return AppPreferencesDataSource(
      ref.watch(sharedPreferencesProvider).when(
            data: (data) => data,
            error: (error, stackTrace) => null,
            loading: () => null,
          ),
    );
  });

  final SharedPreferences? _prefs;

  Future<String> getUsername() async {
    return _prefs?.getString(_usernameKey) ?? '';
  }

  Future<void> setUsername(String username) async {
    await _prefs?.setString(_usernameKey, username);
  }
}
