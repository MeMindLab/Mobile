import 'package:json_annotation/json_annotation.dart';

part 'auth_sms_model.g.dart';

@JsonSerializable()
class AuthSmsModel {
  final String message;
  @JsonKey(name: "message_sid")
  final String messageSid;

  AuthSmsModel({
    required this.message,
    required this.messageSid,
  });

  factory AuthSmsModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSmsModelFromJson(json);
}
