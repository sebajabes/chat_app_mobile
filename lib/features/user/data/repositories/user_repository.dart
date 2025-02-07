import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../user.dart';
import 'base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  UserRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance; 

  final Dio _dioClient;
  @override
  Future<AppResponse<List<UserModel>>> getUser() async {
    final response = await _dioClient.get(
      Endpoints.getUser,
    );

    print('=== USERRESPONSE = $response ===');

    return AppResponse<List<UserModel>>.fromJson(
      response.data,
      (dynamic json) {
        if (json != null && response.data['success']) {
          return (json as List<dynamic>)
              .map((user) => UserModel.fromJson(user))
              .toList();
        }
        return [];
      },
    );
  }
}
