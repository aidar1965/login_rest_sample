import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:login_rest_sample/domain/interfaces/i_auth_controller.dart';
import 'package:login_rest_sample/domain/interfaces/i_local_cache.dart';
import 'package:login_rest_sample/domain/models/tokens_pair.dart';

import '../../../locator/locator.dart';

@LazySingleton(as: IAuthController)
class AuthController extends ChangeNotifier implements IAuthController {
  final ILocalCache localCache = getIt<ILocalCache>();
  late bool _isAuthenticated;

  @override
  void addChangeListener(Function() listener) => addListener(listener);

  @override
  void removeChangeListener(Function() listener) => removeListener(listener);

  @override
  Future<AuthController> init() async {
    _isAuthenticated = (await localCache.getAuthTokens() != null);
    return this;
  }

  @override
  bool get isAuthenticated => _isAuthenticated;

  @override
  Future<void> onAuthenticated({required TokensPair tokensPair}) async {
    await localCache.setAuthTokens(tokens: tokensPair);
    _isAuthenticated = true;
    notifyListeners();
  }

  @override
  void onAuthenticationFailed() async {
    await localCache.deleteAuthTokens();
    _isAuthenticated = false;
    notifyListeners();
  }

  @override
  void setAuthStatus(bool status) {
    _isAuthenticated = status;
    notifyListeners();
  }
}
