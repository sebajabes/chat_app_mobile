import '../../../../../core/core.dart';
import '../../../../user/user.dart';
import '../../models/models.dart';

abstract class BaseAuthRepository {
  Future<AppResponse<AuthUser?>> login(LoginRequest request);

  Future<AppResponse<AuthUser?>> register(RegisterRequest request);

  Future<AppResponse<UserModel?>> loginWithToken();

  Future<AppResponse> logout();
}
