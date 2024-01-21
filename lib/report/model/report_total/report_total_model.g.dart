// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTotalModel _$ReportTotalModelFromJson(Map<String, dynamic> json) =>
    ReportTotalModel(
      code: json['code'] as String,
      msg: json['msg'] as String,
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportTotalModelToJson(ReportTotalModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      reports: (json['reports'] as List<dynamic>)
          .map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekly: (json['weekly'] as List<dynamic>)
          .map((e) => Weekly.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'reports': instance.reports,
      'weekly': instance.weekly,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      reportId: json['report_id'] as int,
      createdAt: json['created_at'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      aiSummary: json['ai_summary'] as String,
      emotion: json['emotion'] as String,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'report_id': instance.reportId,
      'created_at': instance.createdAt,
      'tags': instance.tags,
      'ai_summary': instance.aiSummary,
      'emotion': instance.emotion,
    };

Weekly _$WeeklyFromJson(Map<String, dynamic> json) => Weekly(
      date: json['date'] as String,
      score: json['score'] as String,
    );

Map<String, dynamic> _$WeeklyToJson(Weekly instance) => <String, dynamic>{
      'date': instance.date,
      'score': instance.score,
    };
