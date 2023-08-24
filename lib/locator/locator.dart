import 'package:get_it/get_it.dart';

import '../data/api/api_facade.dart';
import '../data/api/http_client/http_client.dart';
import '../data/api/mapper/mapper.dart';
import '../data/local_cache/local_cache.dart';
import '../domain/controllers/auth_controller/auth_controller.dart';
import '../domain/interfaces/i_api_facade.dart';
import '../domain/interfaces/i_auth_controller.dart';
import '../domain/interfaces/i_local_cache.dart';
import '../domain/interfaces/i_user_repository.dart';
import '../domain/repositories/user_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<ILocalCache>(() => LocalCache());
  getIt.registerFactory<ApiDataMapper>(() => ApiDataMapper());
  getIt.registerFactory<DioClient>(() => DioClient());
  getIt.registerFactory<IApiFacade>(() => ApiFacade());
  getIt.registerSingletonAsync<IAuthController>(
      () async => AuthController().init());

  getIt.registerSingletonWithDependencies<IUserRepository>(
      () => UserRepository(),
      dependsOn: [IAuthController]);
}
