import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/login_req.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUsecases extends UsecaseWithParams<LoginEntity, LoginReq> {
  final LoginRepository _repository;

  LoginUsecases({required LoginRepository repository}) : _repository = repository;

  @override
  ResultFuture<LoginEntity> call(LoginReq params) {
    return _repository.doLogin(params);
  }
}
