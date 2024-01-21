import 'package:json_annotation/json_annotation.dart';

part 'report_total_model.g.dart';

@JsonSerializable()
class ReportTotalModel {
  final String code;
  final String msg;
  final Result result;
  ReportTotalModel({
    required this.code,
    required this.msg,
    required this.result,
  });
  factory ReportTotalModel.fromJson(Map<String, dynamic> json) =>
      _$ReportTotalModelFromJson(json);
}

@JsonSerializable()
class Result {
  final List<Report> reports;
  final List<Weekly> weekly;
  Result({
    required this.reports,
    required this.weekly,
  });
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@JsonSerializable()
class Report {
  @JsonKey(name: 'report_id')
  final int reportId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final List<String> tags;
  @JsonKey(name: "ai_summary")
  final String aiSummary;
  final String emotion;
  Report({
    required this.reportId,
    required this.createdAt,
    required this.tags,
    required this.aiSummary,
    required this.emotion,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

@JsonSerializable()
class Weekly {
  final String date;
  final String score;
  Weekly({
    required this.date,
    required this.score,
  });
  factory Weekly.fromJson(Map<String, dynamic> json) => _$WeeklyFromJson(json);
}
