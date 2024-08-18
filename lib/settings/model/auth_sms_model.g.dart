// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_sms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthSmsModel _$AuthSmsModelFromJson(Map<String, dynamic> json) => AuthSmsModel(
      message: json['message'] as String,
      messageSid: json['message_sid'] as String,
    );

Map<String, dynamic> _$AuthSmsModelToJson(AuthSmsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'message_sid': instance.messageSid,
    };
