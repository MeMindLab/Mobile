import 'package:json_annotation/json_annotation.dart';

part 'report_search_model.g.dart';

@JsonSerializable()
class ReportSearchModel {
  final String code;
  final String msg;
  final Result result;
  ReportSearchModel({
    required this.code,
    required this.msg,
    required this.result,
  });
  factory ReportSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ReportSearchModelFromJson(json);
}

@JsonSerializable()
class Result {
  final List<Report> report;

  Result({
    required this.report,
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
  final String thumbnail;

  Report({
    required this.reportId,
    required this.createdAt,
    required this.tags,
    required this.aiSummary,
    required this.thumbnail,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
