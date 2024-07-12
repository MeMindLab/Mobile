// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatImageModel _$ChatImageModelFromJson(Map<String, dynamic> json) =>
    ChatImageModel(
      imageUrl: json['imgae_url'] as String?,
      conversationId: json['conversation_id'] as String?,
    );

Map<String, dynamic> _$ChatImageModelToJson(ChatImageModel instance) =>
    <String, dynamic>{
      'imgae_url': instance.imageUrl,
      'conversation_id': instance.conversationId,
    };
