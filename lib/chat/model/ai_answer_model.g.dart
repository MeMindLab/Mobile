// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiAnswerModel _$AiAnswerModelFromJson(Map<String, dynamic> json) =>
    AiAnswerModel(
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AiAnswerModelToJson(AiAnswerModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      message: json['message'] as String,
      isEnough: json['is_enough'] as bool,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'message': instance.message,
      'is_enough': instance.isEnough,
    };
