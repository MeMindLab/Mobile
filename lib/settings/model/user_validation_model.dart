import 'package:json_annotation/json_annotation.dart';

part 'user_validation_model.g.dart';

@JsonSerializable()
class UserValidationModel {
  final bool result;
  UserValidationModel({
    required this.result,
  });

  factory UserValidationModel.fromJson(Map<String, dynamic> json) =>
      _$UserValidationModelFromJson(json);
}
