// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      message: json['message'] as String,
      index: json['index'] as int,
      is_ai: json['is_ai'] as bool,
      is_image: json['is_image'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'index': instance.index,
      'is_ai': instance.is_ai,
      'is_image': instance.is_image,
      'createdAt': instance.createdAt,
    };
