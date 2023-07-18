import 'package:flutter/foundation.dart';
import 'package:login_rest_sample/domain/models/tokens_pair.dart';
import 'package:login_rest_sample/domain/models/user.dart';

@immutable
class LoginResult {
  // ---------------------------------------------------------------------------
  const LoginResult({
    required this.user,
    required this.tokensPair,
  });
  // ---------------------------------------------------------------------------

  final User user;
  final TokensPair tokensPair;
}
