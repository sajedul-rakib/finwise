import '../../../signup/domain/entities/user_entity.dart';
import '../repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;
  GetProfileUseCase(this.repository);

  Future<UserEntity> execute() async {
    return await repository.getLoggedUserProfileData();
  }
}
