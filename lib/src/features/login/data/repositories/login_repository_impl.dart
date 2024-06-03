import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/login_req.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_data_src.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSrc _dataSrc;

  LoginRepositoryImpl({required LoginDataSrc dataSrc}) : _dataSrc = dataSrc;

  @override
  ResultFuture<UserEntity> doLogin(LoginReq params) async {
    try {
      final result = await _dataSrc.loginRequest(params.toJson());
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
