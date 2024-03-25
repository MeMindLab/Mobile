// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportSearchModel _$ReportSearchModelFromJson(Map<String, dynamic> json) =>
    ReportSearchModel(
      code: json['code'] as String,
      msg: json['msg'] as String,
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportSearchModelToJson(ReportSearchModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      report: (json['report'] as List<dynamic>)
          .map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'report': instance.report,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      reportId: json['report_id'] as int,
      createdAt: json['created_at'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      aiSummary: json['ai_summary'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'report_id': instance.reportId,
      'created_at': instance.createdAt,
      'tags': instance.tags,
      'ai_summary': instance.aiSummary,
      'thumbnail': instance.thumbnail,
    };
