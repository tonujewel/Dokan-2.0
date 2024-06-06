import '../../../../core/usecases/usecases.dart';
import '../../../../core/utils/typedef.dart';
import '../../data/models/user_model.dart';
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

class UpdateProfileUseCase extends UsecaseWithParams<UserModel, UpdateProfileReq> {
  final ProfileRepository repository;

  UpdateProfileUseCase({required this.repository});
  @override
  ResultFuture<UserModel> call(UpdateProfileReq params) {
    return repository.updateProfile(params);
  }
}
