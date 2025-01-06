import 'package:bloom_app/app/constants/api_constants.dart';
import 'package:bloom_app/data/base_api/base_api.dart';
import 'package:dio/dio.dart';

import '../models/user_model.dart';

class Repository {
  final BaseApi _baseApi;

  Repository(this._baseApi);

  Future<List<UserModel>> fetchUsers() async {
    final response = await _baseApi.get(ApiConstants.userEndpoint);

    // Kiểm tra dữ liệu trả về từ API
    final data = response.data as List;

    // Ánh xạ từ JSON sang List<UserModel>
    return data.map((userJson) => UserModel.fromJson(userJson)).toList();
  }

  Future<Response> createUser(Map<String, dynamic> userData) async {
    return await _baseApi.post('/users', data: userData);
  }

  Future<Response> updateUser(
      String userId, Map<String, dynamic> userData) async {
    return await _baseApi.put('/users/$userId', data: userData);
  }

  Future<Response> deleteUser(String userId) async {
    return await _baseApi.delete('/users/$userId');
  }
}
