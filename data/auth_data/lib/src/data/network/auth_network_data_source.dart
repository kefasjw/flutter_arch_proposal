import 'package:auth_data/src/data/network/login_response.dart';
import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';

class AuthNetworkDataSource {
  AuthNetworkDataSource(this._client);

  static final provider = Provider((ref) {
    return AuthNetworkDataSource(
      ref.watch(HttpClient.provider),
    );
  });

  final HttpClient _client;

  Future<String> login() async {
    final response = await _client.post(path: 'login');
    final loginResponse = LoginResponse.fromJson(response);
    return loginResponse.token;
  }
}
