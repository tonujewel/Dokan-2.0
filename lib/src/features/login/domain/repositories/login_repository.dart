import '../../../../core/utils/typedef.dart';
import '../entities/login_req.dart';
import '../entities/user_entity.dart';

abstract class LoginRepository {
  ResultFuture<UserEntity> doLogin(LoginReq req);
}
