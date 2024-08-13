// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDailyModel _$CreateDailyModelFromJson(Map<String, dynamic> json) =>
    CreateDailyModel(
      reportId: json['report_id'] as String,
      keyword:
          (json['keyword'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateDailyModelToJson(CreateDailyModel instance) =>
    <String, dynamic>{
      'report_id': instance.reportId,
      'keyword': instance.keyword,
    };
