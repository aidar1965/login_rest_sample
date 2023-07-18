// MAP RESPONSES
import 'package:login_rest_sample/domain/models/login_result.dart';

import '../../../domain/models/tokens_pair.dart';
import '../../../domain/models/user.dart';
import '../models/responses/login_result_dto.dart';
import '../models/responses/tokens_pair_dto.dart';
import '../models/responses/user_dto.dart';

class ApiDataMapper {
  User mapUser(UserDto dto) =>
      User(email: dto.email ?? '', nickName: dto.nickName ?? '');

  TokensPair mapTokensPair(TokensPairDto dto) {
    return TokensPair(
      refreshToken: dto.refreshToken,
      accessToken: dto.token,
    );
  }

  LoginResult mapLoginResult(LoginResultDto dto) {
    return LoginResult(
        user: mapUser(dto.userDto),
        tokensPair: mapTokensPair(dto.tokensPairDto));
  }
}
