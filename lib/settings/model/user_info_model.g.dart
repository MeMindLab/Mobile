// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      email: json['email'] as String?,
      id: json['id'] as String?,
      nickname: json['nickname'] as String?,
      isActive: json['is_active'] as bool?,
      isVerified: json['is_verified'] as bool?,
      role: json['role'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updatedAt'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'nickname': instance.nickname,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'mobile': instance.mobile,
    };
