import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../data/repositories/user_repository.dart';
import '../../data/sources/user_api_source.dart';
import '../../domain/use_cases/get_user_profile.dart';
import '../../presentation/viewmodels/user_profile_viewmodel.dart';

final GetIt injector = GetIt.instance;

void setupDependencies() {
  // Core dependencies
  injector.registerSingleton<Dio>(Dio());

  // Data layer
  injector.registerLazySingleton<UserApiSource>(() => UserApiSource(injector()));
  injector.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(injector()));

  // Domain layer
  injector.registerLazySingleton(() => GetUserProfile(injector()));

  // Presentation layer
  injector.registerFactory(() => UserProfileViewModel(injector()));
}
