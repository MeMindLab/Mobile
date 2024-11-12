import 'package:json_annotation/json_annotation.dart';

part 'user_signup_model.g.dart';

@JsonSerializable()
class UserSignUpModel {
  final String email;
  final String id;
  final String nickname;
  @JsonKey(name: "is_active")
  final bool isActive;
  @JsonKey(name: "is_verified")
  final bool isVerified;
  final String role;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;

  UserSignUpModel({
    required this.email,
    required this.id,
    required this.nickname,
    required this.isActive,
    required this.isVerified,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpModelFromJson(json);
}
