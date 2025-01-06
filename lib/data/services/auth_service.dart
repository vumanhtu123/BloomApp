import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://example.com/api/login',
        data: {'email': email, 'password': password},
      );
      return response.data['token'];
    } catch (e) {
      throw Exception('Login failed');
    }
  }
}
