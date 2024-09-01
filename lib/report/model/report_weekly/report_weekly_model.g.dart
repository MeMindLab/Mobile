// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_weekly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportWeeklyModel _$ReportWeeklyModelFromJson(Map<String, dynamic> json) =>
    ReportWeeklyModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => TodayScore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportWeeklyModelToJson(ReportWeeklyModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

TodayScore _$TodayScoreFromJson(Map<String, dynamic> json) => TodayScore(
      date: json['date'] as String,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$TodayScoreToJson(TodayScore instance) =>
    <String, dynamic>{
      'date': instance.date,
      'score': instance.score,
    };
