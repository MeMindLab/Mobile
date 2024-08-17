// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_lemon_patch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLemonPatchModel _$UserLemonPatchModelFromJson(Map<String, dynamic> json) =>
    UserLemonPatchModel(
      userId: json['user_id'] as String,
      lemonCount: json['lemon_count'] as int,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserLemonPatchModelToJson(
        UserLemonPatchModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'lemon_count': instance.lemonCount,
      'id': instance.id,
    };
