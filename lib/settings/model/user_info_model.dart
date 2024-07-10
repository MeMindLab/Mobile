import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final String? email;
  final int? id;
  final String? username;
  final String? nickname;
  @JsonKey(name: "is_active")
  final bool? isActive;
  @JsonKey(name: "is_verified")
  final bool? isVerified;
  final String? role;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  final int? lemons;

  UserInfoModel({
    this.email,
    this.id,
    this.username,
    this.nickname,
    this.isActive,
    this.isVerified,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.lemons,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
