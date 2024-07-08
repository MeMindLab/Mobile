import 'package:json_annotation/json_annotation.dart';

part "user_lemon_model.g.dart";

@JsonSerializable()
class UserLemonModel {
  @JsonKey(name: "lemon_count")
  final int lemonCount;
  @JsonKey(name: "user_id")
  final int userId;

  UserLemonModel({
    required this.lemonCount,
    required this.userId,
  });

  factory UserLemonModel.fromJson(Map<String, dynamic> json) =>
      _$UserLemonModelFromJson(json);
}
