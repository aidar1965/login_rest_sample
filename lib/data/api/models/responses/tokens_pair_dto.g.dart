// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_pair_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokensPairDto _$TokensPairDtoFromJson(Map<String, dynamic> json) =>
    TokensPairDto(
      token: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$TokensPairDtoToJson(TokensPairDto instance) =>
    <String, dynamic>{
      'accessToken': instance.token,
      'refreshToken': instance.refreshToken,
    };
