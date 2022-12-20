import 'dart:convert';
import 'dart:io';

import 'package:core/src/config/app_config.dart';
import 'package:core/src/network/exceptions.dart';
import 'package:core/src/secure_storage/app_secure_storage_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient(this._config, this._secureStorageDataSource);

  static final provider = Provider(
    (ref) {
      return HttpClient(
        ref.watch(AppConfig.provider),
        ref.watch(AppSecureStorageDataSource.provider),
      );
    },
  );

  final AppConfig _config;

  final AppSecureStorageDataSource _secureStorageDataSource;

  late final _client = http.Client();

  final _baseHeaders = const {
    'Content-Type': 'application/json',
  };

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic /*String|Iterable<String>*/ >? queryParameters,
  }) async {
    final response = await _handleError(() async {
      return _client.get(
        _uri(path: path, queryParameters: queryParameters),
        headers: await _headers(headers),
      );
    });
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> post({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic /*String|Iterable<String>*/ >? queryParameters,
    Object? body,
  }) async {
    final response = await _handleError(() async {
      return _client.post(
        _uri(path: path, queryParameters: queryParameters),
        headers: await _headers(headers),
      );
    });
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  Future<http.Response> _handleError(
    Future<http.Response> Function() apiCall,
  ) async {
    final response = await apiCall();
    if (response.statusCode != HttpStatus.ok) {
      throw HttpStatusCodeException(response.statusCode);
    }
    return response;
  }

  Uri _uri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
      scheme: _config.apiScheme,
      host: _config.apiHost,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Future<Map<String, String>> _headers(Map<String, String>? headers) async {
    return {
      ..._baseHeaders,
      ...await _authHeader(),
      if (headers != null) ...headers,
    };
  }

  Future<Map<String, String>> _authHeader() async {
    final token = await _secureStorageDataSource.getToken();
    return {
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }
}
