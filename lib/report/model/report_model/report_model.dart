import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

abstract class ReportCursorPaginationBase {}

class ReportCursorPaginationError extends ReportCursorPaginationBase {}

class ReportCursorPaginationLoading extends ReportCursorPaginationBase {}

@JsonSerializable()
class ReportModel extends ReportCursorPaginationBase {
  @JsonKey(name: "next_cursor")
  final String? nextCursor;
  final List<Report>? reports;
  ReportModel({
    this.nextCursor,
    this.reports,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  ReportModel copyWith({
    String? nextCursor,
    List<Report>? reports,
  }) {
    return ReportModel(
      nextCursor: nextCursor ?? this.nextCursor,
      reports: reports ?? this.reports,
    );
  }
}

@JsonSerializable()
class Report {
  @JsonKey(name: "report_id")
  final String? reportId;
  @JsonKey(name: "conversation_id")
  final String? conversationId;
  final List<String>? tags;
  @JsonKey(name: "ai_summary")
  final String? aiSummary;
  final String? thumbnail;
  @JsonKey(name: "created_at")
  final String? createdAt;
  Report({
    this.reportId,
    this.conversationId,
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
      reportId: id ?? this.reportId,
      tags: tags ?? this.tags,
      aiSummary: aiSummary ?? this.aiSummary,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ReportCursorPaginationFetchingMore extends ReportModel {
  ReportCursorPaginationFetchingMore(
      {required super.nextCursor, required super.reports});
}
