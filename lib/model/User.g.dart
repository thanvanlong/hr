// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['accessToken'] as String,
      json['refreshToken'] as String,
      json['email'] as String,
      json['password'] as String,
      json['avatar'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
    };
