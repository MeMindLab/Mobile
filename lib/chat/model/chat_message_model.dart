import 'package:json_annotation/json_annotation.dart';

part 'chat_message_model.g.dart';

abstract class ChatMessageBase {}

@JsonSerializable()
class ChatMessageModel extends ChatMessageBase {
  final String message;
  final int index;
  final bool is_ai;
  final bool is_image;
  final String createdAt;

  ChatMessageModel({
    required this.message,
    required this.index,
    required this.is_ai,
    required this.is_image,
    required this.createdAt,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}

class ChatMessageLoading extends ChatMessageBase {}

class ChatMessageError extends ChatMessageBase {}
