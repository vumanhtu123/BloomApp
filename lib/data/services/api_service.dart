import '../models/user_model.dart';
import '../repositories/repository.dart';

class ApiService {
  final Repository _repository;

  ApiService(this._repository);

  Future<List<UserModel>> fetchUsers() async {
    final response = await _repository.fetchUsers();
    return response;
  }
}
