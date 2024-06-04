import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../../../register/domain/entities/success_entity.dart';
import '../entities/update_profile_req.dart';
import '../entities/user_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileUsecase extends UsecaseWithoutParams<UserEntity> {
  final ProfileRepository repository;

  GetProfileUsecase({required this.repository});

  @override
  ResultFuture<UserEntity> call() async {
    return await repository.getProfileInfo();
  }
}

class UpdateProfileUseCase extends UsecaseWithParams<SuccessEntity, UpdateProfileReq> {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});
  @override
  ResultFuture<SuccessEntity> call(UpdateProfileReq params) {
    return repository.updateProfile(params);
  }
}
