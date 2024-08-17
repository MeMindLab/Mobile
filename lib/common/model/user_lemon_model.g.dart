// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLemonModel _$UserLemonModelFromJson(Map<String, dynamic> json) =>
    UserLemonModel(
      lemonCount: json['lemon_count'] as int,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$UserLemonModelToJson(UserLemonModel instance) =>
    <String, dynamic>{
      'lemon_count': instance.lemonCount,
      'user_id': instance.userId,
    };
