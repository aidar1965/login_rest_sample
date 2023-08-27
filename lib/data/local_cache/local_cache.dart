import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:login_rest_sample/domain/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/interfaces/i_local_cache.dart';
import '../../domain/models/tokens_pair.dart';

class LocalCache implements ILocalCache {
  final secureStorage = const FlutterSecureStorage();

  static const tokensPairKey = 'tokens';
  static const userKey = 'user';

  // ---------------------------------------------------------------------------
  // Read tokens from cache
  @override
  Future<TokensPair?> getAuthTokens() async {
    try {
      final String? tokenJson = await secureStorage.read(key: tokensPairKey);
      return tokenJson != null ? tokensFromJson(tokenJson) : null;
    } on PlatformException {
      // Workaround for https://github.com/mogol/flutter_secure_storage/issues/43
      await secureStorage.deleteAll();
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Save new tokens to cache
  @override
  Future<void> setAuthTokens({required TokensPair tokens}) async {
    await secureStorage.write(
        key: tokensPairKey,
        value: tokensToJson(tokens.accessToken, tokens.refreshToken));
  }

  // ---------------------------------------------------------------------------
  // Delete auth tokens
  @override
  Future<void> deleteAuthTokens() async {
    await secureStorage.delete(key: tokensPairKey);
  }

  // ---------------------------------------------------------------------------
  String tokensToJson(String accessToken, String refreshToken) {
    return jsonEncode(
        {'accessToken': accessToken, 'refreshToken': refreshToken});
  }

  // ---------------------------------------------------------------------------
  TokensPair tokensFromJson(String json) {
    // final jsonObject = Map<String, String>.from(jsonDecode(json));
    final jsonObject = jsonDecode(json) as Map<String, dynamic>;
    return TokensPair(
        accessToken: '${jsonObject['accessToken']}',
        refreshToken: '${jsonObject['refreshToken']}');
  }

  @override
  Future<User?> getUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final string = sharedPreferences.getString(userKey);
    if (string != null) {
      final jsonObject = jsonDecode(string) as Map<String, dynamic>;
      return User(
        email: jsonObject['email'] as String,
        nickName: jsonObject['nickName'] as String,
        phone: jsonObject['phone'] as String?,
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveUser({required User user}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        userKey,
        jsonEncode({
          'email': user.email,
          'nickName': user.nickName,
          'phone': user.phone
        }));
  }
}
