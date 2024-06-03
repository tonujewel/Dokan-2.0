import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/login_req.dart';
import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

class LoginUsecases extends UsecaseWithParams<UserEntity, LoginReq> {
  final LoginRepository _repository;

  LoginUsecases({required LoginRepository repository}) : _repository = repository;

  @override
  ResultFuture<UserEntity> call(LoginReq params) {
    return _repository.doLogin(params);
  }
}
