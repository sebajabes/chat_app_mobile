import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../../../user/user.dart';
import '../../data.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;

  final Dio _dioClient;

  @override
  Future<AppResponse<AuthUser?>> login(LoginRequest request) async {
    final response = await _dioClient.post(
      Endpoints.login,
      data: request.toJson(),
    );

    return AppResponse<AuthUser?>.fromJson(
      response.data,
      (dynamic json) {
        if (json != null && response.data['success']) {
          return AuthUser.fromJson(json);
        }

        return null;
      },
    );
  }

  @override
  Future<AppResponse<UserModel?>> loginWithToken() async {
    final response = await _dioClient.post(
      Endpoints.loginWithToken,
    );

    return AppResponse<UserModel?>.fromJson(
      response.data,
      (dynamic json) {
        if (json != null && response.data['success']) {
          return UserModel.fromJson(json);
        }
        null;
        return null;
      },
    );
  }

  @override
  Future<AppResponse> logout() async {
    final response = await _dioClient.get(
      Endpoints.logout,
    );

    return AppResponse<AuthUser?>.fromJson(
      response.data,
      (dynamic json) => null,
    );
  }

  @override
  Future<AppResponse<AuthUser?>> register(RegisterRequest request) async {
    final response = await _dioClient.post(
      Endpoints.register,
      data: request.toJson(),
    );

    return AppResponse<AuthUser?>.fromJson(
      response.data,
      (dynamic json) {
        if (json != null && response.data['success']) {
          return AuthUser.fromJson(json);
        }
        null;
        return null;
      },
    );
  }
}
