import 'package:json_annotation/json_annotation.dart';

part 'report_month_model.g.dart';

@JsonSerializable()
class ReportMonthModel {
  @JsonKey(name: "next_cursor")
  final String? nextCursor;
  final List<Report>? reports;
  ReportMonthModel({
    this.nextCursor,
    this.reports,
  });

  factory ReportMonthModel.fromJson(Map<String, dynamic> json) =>
      _$ReportMonthModelFromJson(json);
}

@JsonSerializable()
class Report {
  final String? id;
  final List<String>? tags;
  @JsonKey(name: "ai_summary")
  final String? aiSummary;
  final String? thumbnail;
  @JsonKey(name: "created_at")
  final String? createdAt;
  Report({
    this.id,
    this.tags,
    this.aiSummary,
    this.thumbnail,
    this.createdAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
