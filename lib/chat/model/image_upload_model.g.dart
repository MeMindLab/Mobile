// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUploadModel _$ImageUploadModelFromJson(Map<String, dynamic> json) =>
    ImageUploadModel(
      conversationId: json['conversation_id'] as String,
      message: json['message'] as String,
      imageUrl: json['image_url'] as String,
      isImage: json['is_image'] as bool,
    );

Map<String, dynamic> _$ImageUploadModelToJson(ImageUploadModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'message': instance.message,
      'image_url': instance.imageUrl,
      'is_image': instance.isImage,
    };
