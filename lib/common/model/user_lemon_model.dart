import 'package:json_annotation/json_annotation.dart';

part "user_lemon_model.g.dart";

@JsonSerializable()
class UserLemonModel {
  @JsonKey(name: "user_id")
  final String userId;
  final String lemon;

  UserLemonModel({
    required this.userId,
    required this.lemon,
  });

  factory UserLemonModel.fromJson(Map<String, dynamic> json) =>
      _$UserLemonModelFromJson(json);
}
