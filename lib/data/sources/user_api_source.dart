import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserApiSource {
  final Dio dio;

  UserApiSource(this.dio);

  Future<UserModel> fetchUserProfile(String userId) async {
    final response = await dio.get('/user/$userId');
    return UserModel.fromJson(response.data);
  }
}
