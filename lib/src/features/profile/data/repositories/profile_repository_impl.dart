import 'package:dartz/dartz.dart';
import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/profile/data/datasources/profile_data_src.dart';
import 'package:dokan/src/features/profile/domain/entities/user_entity.dart';
import 'package:dokan/src/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

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
}
