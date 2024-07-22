// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUploadModel _$ImageUploadModelFromJson(Map<String, dynamic> json) =>
    ImageUploadModel(
      conversationId: json['converstaion_id'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$ImageUploadModelToJson(ImageUploadModel instance) =>
    <String, dynamic>{
      'converstaion_id': instance.conversationId,
      'image_url': instance.imageUrl,
    };
