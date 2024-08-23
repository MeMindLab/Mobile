// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportMonthModel _$ReportMonthModelFromJson(Map<String, dynamic> json) =>
    ReportMonthModel(
      nextCursor: json['next_cursor'] as String?,
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportMonthModelToJson(ReportMonthModel instance) =>
    <String, dynamic>{
      'next_cursor': instance.nextCursor,
      'reports': instance.reports,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      aiSummary: json['ai_summary'] as String?,
      thumbnail: json['thumbnail'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
      'ai_summary': instance.aiSummary,
      'thumbnail': instance.thumbnail,
      'created_at': instance.createdAt,
    };
