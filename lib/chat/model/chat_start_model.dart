import 'package:json_annotation/json_annotation.dart';

part 'chat_start_model.g.dart';

@JsonSerializable()
class ChatStartModel {
  @JsonKey(name: "conversation_id")
  final String conversationId;
  @JsonKey(name: "chat_history")
  final List<ChatHistory> chatHistory;
  @JsonKey(name: "is_enough")
  final bool isEnough;
  ChatStartModel({
    required this.conversationId,
    required this.chatHistory,
    required this.isEnough,
  });
  factory ChatStartModel.fromJson(Map<String, dynamic> json) =>
      _$ChatStartModelFromJson(json);
}

@JsonSerializable()
class ChatHistory {
  final int order;
  @JsonKey(name: "is_from_user")
  final bool isFromUser;
  @JsonKey(name: "message_id")
  final String id;
  final String message;
  @JsonKey(name: "message_timestamp")
  final String messageTimestamp;
  @JsonKey(name: "image_url")
  String? imageUrl;

  ChatHistory(
      {required this.order,
      required this.isFromUser,
      required this.id,
      required this.message,
      required this.messageTimestamp,
      this.imageUrl});

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);
}
