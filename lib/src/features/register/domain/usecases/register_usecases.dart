import 'package:dokan/src/core/usecases/usecases.dart';
import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/register/data/datasources/register_req.dart';
import 'package:dokan/src/features/register/domain/entities/success_entity.dart';
import 'package:dokan/src/features/register/domain/repositories/register_repository.dart';

class RegisterUsecases extends UsecaseWithParams<SuccessEntity, RegisterReq> {
  final RegisterRepository repository;

  RegisterUsecases({required this.repository});
  @override
  ResultFuture<SuccessEntity> call(RegisterReq params) async {
    return await repository.doRegister(params);
  }
}
