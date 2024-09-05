import 'package:json_annotation/json_annotation.dart';

part 'image_update_model.g.dart';

@JsonSerializable()
class ImageUpdateModel {
  final String message;
  ImageUpdateModel({
    required this.message,
  });

  factory ImageUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUpdateModelFromJson(json);
}
