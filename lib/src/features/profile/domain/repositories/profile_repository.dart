import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  ResultFuture<UserEntity> getProfileInfo();
}
