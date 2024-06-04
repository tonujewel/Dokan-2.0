import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/profile/domain/entities/update_profile_req.dart';
import 'package:dokan/src/features/profile/domain/entities/user_entity.dart';
import 'package:dokan/src/features/register/domain/entities/success_entity.dart';

abstract class ProfileRepository {
  ResultFuture<UserEntity> getProfileInfo();
  ResultFuture<SuccessEntity> updateProfile(UpdateProfileReq body);
}
