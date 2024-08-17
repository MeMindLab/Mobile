import 'package:json_annotation/json_annotation.dart';

part 'user_lemon_patch_model.g.dart';

@JsonSerializable()
class UserLemonPatchModel {
  @JsonKey(name: "user_id")
  final String userId;
  @JsonKey(name: "lemon_count")
  final int lemonCount;
  final String id;

  UserLemonPatchModel({
    required this.userId,
    required this.lemonCount,
    required this.id,
  });

  factory UserLemonPatchModel.fromJson(Map<String, dynamic> json) =>
      _$UserLemonPatchModelFromJson(json);
}
