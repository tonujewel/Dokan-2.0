import '../../../../core/utils/typedef.dart';
import '../entities/login_req.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  ResultFuture<LoginEntity> doLogin(LoginReq req);
}
