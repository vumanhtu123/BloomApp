import '../entities/user_entity.dart';
import '../../data/repositories/user_repository.dart';

class GetUserProfile {
  final UserRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call(String userId) {
    return repository.getUserProfile(userId);
  }
}
