import 'package:dartz/dartz.dart';
import 'package:dokan/src/core/errors/exceptions.dart';
import 'package:dokan/src/core/errors/failure.dart';
import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/register/data/datasources/register_data_src.dart';
import 'package:dokan/src/features/register/data/datasources/register_req.dart';
import 'package:dokan/src/features/register/domain/entities/success_entity.dart';
import 'package:dokan/src/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSrc dataSrc;

  RegisterRepositoryImpl({required this.dataSrc});
  @override
  ResultFuture<SuccessEntity> doRegister(RegisterReq req) async {
    try {
      final result = await dataSrc.doRegister(req);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
