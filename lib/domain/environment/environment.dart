// import 'package:login_rest_sample/domain/interfaces/i_api_facade.dart';

// import '../../data/api/api_facade.dart';
// import '../../data/local_cache/local_cache.dart';
// import '../controllers/auth_controller/auth_controller.dart';
// import '../interfaces/i_auth_controller.dart';
// import '../interfaces/i_local_cache.dart';
// import '../interfaces/i_user_repository.dart';
// import '../repositories/user_repository.dart';

// class Environment {
//   static Future<Map<Type, Object>> buildEnvironment({
//     Map<Type, Object>? initialMap,
//   }) async {
//     final Map<Type, Object> ret = initialMap ?? {};

//     final ILocalCache localCache = LocalCache();
//     ret[ILocalCache] = localCache;

//     final IApiFacade api = ApiFacade();
//     ret[IApiFacade] = api;

//     final IAuthController authController =
//         AuthController(localCache: localCache);
//     await authController.init();
//     ret[IAuthController] = authController;

//     final IUserRepository userRepository = UserRepository();
//     ret[IUserRepository] = userRepository;
//     return ret;
//   }
// }
