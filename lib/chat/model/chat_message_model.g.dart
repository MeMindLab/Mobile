// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      message: json['message'] as String,
      index: json['index'] as int,
      isAi: json['isAi'] as bool,
      isImage: json['isImage'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'index': instance.index,
      'isAi': instance.isAi,
      'isImage': instance.isImage,
      'createdAt': instance.createdAt,
    };
