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
  final SmsVerifyDataResult result;
  SmsVerifyData({
    required this.result,
  });
  factory SmsVerifyData.fromJson(Map<String, dynamic> json) =>
      _$SmsVerifyDataFromJson(json);
}

@JsonSerializable()
class SmsVerifyDataResult {
  final String to;
  final String channel;
  final String status;
  final bool valid;
  SmsVerifyDataResult({
    required this.to,
    required this.channel,
    required this.status,
    required this.valid,
  });

  factory SmsVerifyDataResult.fromJson(Map<String, dynamic> json) =>
      _$SmsVerifyDataResultFromJson(json);
}
