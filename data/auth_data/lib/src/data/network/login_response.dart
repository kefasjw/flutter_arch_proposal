import 'package:shared_dependency/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

class Zxc {}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'token') required String token,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
