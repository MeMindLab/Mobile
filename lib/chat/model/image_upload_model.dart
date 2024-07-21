import 'package:json_annotation/json_annotation.dart';

part 'image_upload_model.g.dart';

@JsonSerializable()
class ImageUploadModel {
  @JsonKey(name: "conversation_id")
  final String conversationId;
  final String message;
  @JsonKey(name: "image_url")
  final String imageUrl;
  @JsonKey(name: "is_image")
  final bool isImage;
  ImageUploadModel({
    required this.conversationId,
    required this.message,
    required this.imageUrl,
    required this.isImage,
  });

  factory ImageUploadModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUploadModelFromJson(json);
}
