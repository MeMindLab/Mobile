import 'package:json_annotation/json_annotation.dart';

part 'auth_sms_verify_model.g.dart';

@JsonSerializable()
class AuthSmsVerifyModel {
  final bool success;
  final SmsVerifyData data;
  AuthSmsVerifyModel({
    required this.success,
    required this.data,
  });
  factory AuthSmsVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSmsVerifyModelFromJson(json);
}

@JsonSerializable()
class SmsVerifyData {
  final String to;
  final String channel;
  final String status;
  final bool valid;
  SmsVerifyData({
    required this.to,
    required this.channel,
    required this.status,
    required this.valid,
  });

  factory SmsVerifyData.fromJson(Map<String, dynamic> json) =>
      _$SmsVerifyDataFromJson(json);
}
