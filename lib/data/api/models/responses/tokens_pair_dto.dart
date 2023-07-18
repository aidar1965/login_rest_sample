import 'package:json_annotation/json_annotation.dart';

part 'tokens_pair_dto.g.dart';

@JsonSerializable()
class TokensPairDto {
  TokensPairDto({
    required this.token,
    required this.refreshToken,
  });

  // ---------------------------------------------------------------------------
  @JsonKey(name: 'accessToken')
  final String token;

  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  static TokensPairDto fromJson(Object json) =>
      _$TokensPairDtoFromJson(json as Map<String, dynamic>);
}
