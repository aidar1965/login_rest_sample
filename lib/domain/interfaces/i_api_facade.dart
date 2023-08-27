import 'package:login_rest_sample/domain/models/login_result.dart';

import '../../data/api/mapper/mapper.dart';

import '../models/tokens_pair.dart';
import 'i_auth_controller.dart';

abstract class IApiFacade {
  ApiDataMapper? mapper;

  // Http-client initialization
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  void setAuthenticateController(IAuthController controller);

  // ---------------------------------------------------------------------------
  void removeAuthenticateController();

  // ---------------------------------------------------------------------------
  Future<void> clearTokens();

  // ---------------------------------------------------------------------------
  Future<void> setTokens(String access, String refresh);

  // API methods
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  // user authenticate
  Future<LoginResult> login({
    required String email,
    required String password,
  });

  Future<TokensPair> refreshTokens({required String refreshToken});
}
