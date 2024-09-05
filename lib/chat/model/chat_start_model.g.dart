// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_start_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatStartModel _$ChatStartModelFromJson(Map<String, dynamic> json) =>
    ChatStartModel(
      conversationId: json['conversation_id'] as String,
      chatHistory: (json['chat_history'] as List<dynamic>)
          .map((e) => ChatHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isEnough: json['is_enough'] as bool,
    );

Map<String, dynamic> _$ChatStartModelToJson(ChatStartModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'chat_history': instance.chatHistory,
      'is_enough': instance.isEnough,
    };

ChatHistory _$ChatHistoryFromJson(Map<String, dynamic> json) => ChatHistory(
      order: json['order'] as int,
      isFromUser: json['is_from_user'] as bool,
      id: json['message_id'] as String,
      message: json['message'] as String,
      messageTimestamp: json['message_timestamp'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$ChatHistoryToJson(ChatHistory instance) =>
    <String, dynamic>{
      'order': instance.order,
      'is_from_user': instance.isFromUser,
      'message_id': instance.id,
      'message': instance.message,
      'message_timestamp': instance.messageTimestamp,
      'image_url': instance.imageUrl,
    };
