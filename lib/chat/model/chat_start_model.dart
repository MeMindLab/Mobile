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
  final int index;
  @JsonKey(name: "is_from_user")
  final bool isFromUser;
  final String id;
  final String message;
  @JsonKey(name: "conversation_id")
  final String conversationId;
  @JsonKey(name: "image_url")
  String? imageUrl;

  ChatHistory(
      {required this.index,
      required this.isFromUser,
      required this.id,
      required this.message,
      required this.conversationId,
      this.imageUrl});

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);
}
