import '../../../../core/core.dart';
import '../../user.dart';

abstract class BaseUserRepository {
  Future<AppResponse<List<UserModel>>> getUser();
}
