// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpModel _$UserSignUpModelFromJson(Map<String, dynamic> json) =>
    UserSignUpModel(
      email: json['email'] as String,
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      isActive: json['is_active'] as bool,
      isVerified: json['is_verified'] as bool,
      role: json['role'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserSignUpModelToJson(UserSignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'nickname': instance.nickname,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
