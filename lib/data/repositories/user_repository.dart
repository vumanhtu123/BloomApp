import '../../domain/entities/user_entity.dart';
import '../sources/user_api_source.dart';

abstract class UserRepository {
  Future<UserEntity> getUserProfile(String userId);
}

class UserRepositoryImpl implements UserRepository {
  final UserApiSource apiSource;

  UserRepositoryImpl(this.apiSource);

  @override
  Future<UserEntity> getUserProfile(String userId) async {
    final userModel = await apiSource.fetchUserProfile(userId);
    return UserEntity(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
    );
  }
}
