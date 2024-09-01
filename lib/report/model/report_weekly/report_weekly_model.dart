import 'package:json_annotation/json_annotation.dart';

part 'report_weekly_model.g.dart';

@JsonSerializable()
class ReportWeeklyModel {
  final List<TodayScore>? results;
  ReportWeeklyModel({
    this.results,
  });

  factory ReportWeeklyModel.fromJson(Map<String, dynamic> json) =>
      _$ReportWeeklyModelFromJson(json);
}

@JsonSerializable()
class TodayScore {
  final String date;
  final double score;
  TodayScore({
    required this.date,
    required this.score,
  });
  factory TodayScore.fromJson(Map<String, dynamic> json) =>
      _$TodayScoreFromJson(json);
}
