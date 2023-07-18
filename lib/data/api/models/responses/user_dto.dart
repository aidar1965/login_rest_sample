import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    this.email,
    this.nickName,
    this.phone,
  });

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'nickname')
  final String? nickName;

  @JsonKey(name: 'phone')
  final String? phone;

  static UserDto fromJson(Object json) =>
      _$UserDtoFromJson(json as Map<String, dynamic>);
}
