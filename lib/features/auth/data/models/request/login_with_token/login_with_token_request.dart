import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_with_token_request.freezed.dart';
part 'login_with_token_request.g.dart';

@freezed
class LoginWithTokenRequest with _$LoginWithTokenRequest {
  factory LoginWithTokenRequest({
    required String token,
  }) = _LoginWithTokenRequest;

  factory LoginWithTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginWithTokenRequestFromJson(json);
}
