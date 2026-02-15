import '../../../signup/domain/entities/user_entity.dart';
import '../repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;
  UpdateProfileUseCase(this.repository);

  Future<UserEntity> execute(String userId, UserEntity user) async {
    return await repository.updateUserData(userId: userId, entity: user);
  }
}
