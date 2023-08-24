import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:login_rest_sample/domain/models/tokens_pair.dart';

abstract class IAuthController {
  bool get isAuthenticated;

  Future<void> onAuthenticated({required TokensPair tokensPair});
  void onAuthenticationFailed();
  Future<IAuthController> init();

  void setAuthStatus(bool status);

  void addChangeListener(VoidCallback listener);

  void removeChangeListener(VoidCallback listener);
}
