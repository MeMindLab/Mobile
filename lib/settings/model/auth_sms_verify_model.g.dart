// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_sms_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSmsVerifyModel _$AuthSmsVerifyModelFromJson(Map<String, dynamic> json) =>
    AuthSmsVerifyModel(
      success: json['success'] as bool,
      data: SmsVerifyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthSmsVerifyModelToJson(AuthSmsVerifyModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

SmsVerifyData _$SmsVerifyDataFromJson(Map<String, dynamic> json) =>
    SmsVerifyData(
      to: json['to'] as String,
      channel: json['channel'] as String,
      status: json['status'] as String,
      valid: json['valid'] as bool,
    );

Map<String, dynamic> _$SmsVerifyDataToJson(SmsVerifyData instance) =>
    <String, dynamic>{
      'to': instance.to,
      'channel': instance.channel,
      'status': instance.status,
      'valid': instance.valid,
    };
