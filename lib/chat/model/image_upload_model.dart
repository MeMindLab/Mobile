import 'package:json_annotation/json_annotation.dart';

part 'image_upload_model.g.dart';

@JsonSerializable()
class ImageUploadModel {
  @JsonKey(name: "conversation_id")
  final String conversationId;
  @JsonKey(name: "image_url")
  final String imageUrl;

  ImageUploadModel({
    required this.conversationId,
    required this.imageUrl,
  });

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUploadModelFromJson(json);
}
