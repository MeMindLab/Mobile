// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      email: json['email'] as String?,
      id: json['id'] as int?,
      username: json['username'] as String?,
      nickname: json['nickname'] as String?,
      isActive: json['is_active'] as bool?,
      role: json['role'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updatedAt'] as String?,
      lemons: json['lemons'] as int?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'username': instance.username,
      'nickname': instance.nickname,
      'is_active': instance.isActive,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'lemons': instance.lemons,
    };
