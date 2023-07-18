// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResultDto _$LoginResultDtoFromJson(Map<String, dynamic> json) =>
    LoginResultDto(
      userDto: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      tokensPairDto:
          TokensPairDto.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResultDtoToJson(LoginResultDto instance) =>
    <String, dynamic>{
      'user': instance.userDto,
      'tokens': instance.tokensPairDto,
    };
