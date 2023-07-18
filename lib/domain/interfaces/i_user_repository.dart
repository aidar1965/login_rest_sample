import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_rest_sample/domain/models/login_result.dart';
import 'package:login_rest_sample/domain/models/tokens_pair.dart';

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
