import 'package:bloom_app/data/base_api/base_api.dart';
import 'package:bloom_app/data/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../data/repositories/repository.dart';
import '../../presentation/viewmodels/user_profile_viewmodel.dart';

final GetIt injector = GetIt.instance;

void setupDependencies() {
  // Core dependencies
  // Tự động hóa quản lý dependency: Giúp tránh việc tạo nhiều instance của cùng một class.

  injector.registerSingleton<Dio>(Dio());

  injector.registerLazySingleton<BaseApi>(() => BaseApi());
  injector
      .registerLazySingleton<Repository>(() => Repository(injector<BaseApi>()));
  injector.registerLazySingleton<ApiService>(
      () => ApiService(injector<Repository>()));
  injector.registerFactory<UserViewModel>(
      () => UserViewModel(injector<ApiService>()));
}
