import 'package:bloom_app/app/constants/api_constants.dart';
import 'package:dio/dio.dart';

class BaseApi {
  late Dio _dio;

  BaseApi() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl, // Đặt URL base của API
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Thêm Interceptor để log hoặc quản lý lỗi
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request[${options.method}] => PATH: ${options.path}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response[${response.statusCode}] => DATA: ${response.data}');
        handler.next(response);
      },
      onError: (DioError e, handler) {
        print('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
        handler.next(e);
      },
    ));
  }

  /// GET request
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }

  /// POST request
  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    return await _dio.post(endpoint, data: data);
  }

  /// PUT request
  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    return await _dio.put(endpoint, data: data);
  }

  /// DELETE request
  Future<Response> delete(String endpoint, {Map<String, dynamic>? data}) async {
    return await _dio.delete(endpoint, data: data);
  }
}
