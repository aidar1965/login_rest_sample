import 'dart:async';

import 'package:login_rest_sample/domain/interfaces/i_user_repository.dart';
import 'package:login_rest_sample/domain/models/user.dart';

import '../interfaces/i_auth_controller.dart';
import '../interfaces/i_local_cache.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required this.localCache,
    required this.authController,
  }) : _userController = StreamController<User?>.broadcast();

  final ILocalCache localCache;
  final StreamController<User?> _userController;
  final IAuthController authController;

  User? _user;

  @override
  User? get user => _user;

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    authController.setAuthStatus(false);
    localCache.deleteAuthTokens();
    _user = null;
  }

  @override
  UserSubscription subscribe(Function(User? u) listener) {
    // TODO: implement subscribe
    throw UnimplementedError();
  }

  @override
  Future<void> setUser(User user) async {
    _user = user;
    await localCache.saveUser(user: user);
    _userController.add(user);
  }

  @override
  Future<User?> getUser() async {
    return await localCache.getUser();
  }
}
