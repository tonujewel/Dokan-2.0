import '../../../../core/utils/typedef.dart';
import '../entities/success_entity.dart';
import '../../data/datasources/register_req.dart';

abstract class RegisterRepository {
  ResultFuture<SuccessEntity> doRegister(RegisterReq req);
}
