import 'package:json_annotation/json_annotation.dart';

import 'tokens_pair_dto.dart';
import 'user_dto.dart';

part 'login_result_dto.g.dart';

@JsonSerializable()
class LoginResultDto {
  LoginResultDto({
    required this.userDto,
    required this.tokensPairDto,
  });

  @JsonKey(name: 'user')
  final UserDto userDto;

  @JsonKey(name: 'tokens')
  final TokensPairDto tokensPairDto;

  static LoginResultDto fromJson(Object json) =>
      _$LoginResultDtoFromJson(json as Map<String, dynamic>);
}
