import 'package:json_annotation/json_annotation.dart';

part 'report_month_model.g.dart';

abstract class ReportCursorPaginationBase {}

class ReportCursorPaginationError extends ReportCursorPaginationBase {}

class ReportCursorPaginationLoading extends ReportCursorPaginationBase {}

@JsonSerializable()
class ReportMonthModel extends ReportCursorPaginationBase {
  @JsonKey(name: "next_cursor")
  final String? nextCursor;
  final List<Report>? reports;
  ReportMonthModel({
    this.nextCursor,
    this.reports,
  });

  factory ReportMonthModel.fromJson(Map<String, dynamic> json) =>
      _$ReportMonthModelFromJson(json);

  ReportMonthModel copyWith({
    String? nextCursor,
    List<Report>? reports,
  }) {
    return ReportMonthModel(
      nextCursor: nextCursor ?? this.nextCursor,
      reports: reports ?? this.reports,
    );
  }
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

  Report copyWith({
    String? id,
    List<String>? tags,
    String? aiSummary,
    String? thumbnail,
    String? createdAt,
  }) {
    return Report(
      id: id ?? this.id,
      tags: tags ?? this.tags,
      aiSummary: aiSummary ?? this.aiSummary,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ReportCursorPaginationFetchingMore extends ReportMonthModel {
  ReportCursorPaginationFetchingMore(
      {required super.nextCursor, required super.reports});
}
