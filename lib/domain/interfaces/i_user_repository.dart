import 'dart:async';

import '../models/user.dart';

typedef UserSubscription = StreamSubscription<User?>;

abstract class IUserRepository {
  User? get user;

  Future<void> logout();

  Future<void> setUser(User user);

  Future<User?> getUser();

  UserSubscription subscribe(Function(User?) listener);

  // close controller, close stream
  Future<void> close();
}
