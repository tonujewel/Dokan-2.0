import 'package:dartz/dartz.dart';
import 'package:dokan/src/features/profile/domain/entities/update_profile_req.dart';
import 'package:dokan/src/features/register/domain/entities/success_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_data_src.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSrc dataSrc;

  ProfileRepositoryImpl({required this.dataSrc});
  @override
  ResultFuture<UserEntity> getProfileInfo() async {
    try {
      final result = await dataSrc.getProfileData();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SuccessEntity> updateProfile(UpdateProfileReq body) async {
    try {
      final result = await dataSrc.updateProfile(body);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
