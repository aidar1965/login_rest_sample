import 'package:login_rest_sample/domain/models/user.dart';

import '../models/tokens_pair.dart';

abstract class ILocalCache {
  // Methods
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // Read tokens from cache
  Future<TokensPair?> getAuthTokens();

  // ---------------------------------------------------------------------------
  // Save new tokens to cache
  Future<void> setAuthTokens({required TokensPair tokens});

  // ---------------------------------------------------------------------------
  // Delete auth tokens
  Future<void> deleteAuthTokens();

  Future<void> saveUser({required User user});

  Future<User?> getUser();
}
