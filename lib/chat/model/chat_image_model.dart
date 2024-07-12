import 'package:json_annotation/json_annotation.dart';

part 'chat_image_model.g.dart';

@JsonSerializable()
class ChatImageModel {
  @JsonKey(name: "imgae_url")
  final String? imageUrl;
  @JsonKey(name: "conversation_id")
  final String? conversationId;

  ChatImageModel({
    this.imageUrl,
    this.conversationId,
  });

  factory ChatImageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatImageModelFromJson(json);
}
