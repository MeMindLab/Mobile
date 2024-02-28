import 'package:json_annotation/json_annotation.dart';

part 'report_detail_model.g.dart';

@JsonSerializable()
class ReportDetailModel {
  final String code;
  final String msg;
  final Result result;

  ReportDetailModel({
    required this.code,
    required this.msg,
    required this.result,
  });

  factory ReportDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailModelFromJson(json);
}

@JsonSerializable()
class Result {
  final Report report;
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
  final String date;
  final int score;
  @JsonKey(name: 'sentiment_analysis')
  final SentimentAnalysis sentimentAnalysis;
  @JsonKey(name: 'report_summary')
  final ReportSummary reportSummary;
  @JsonKey(name: 'drawing_diary')
  final DrawingDiary drawingDiary;
  @JsonKey(name: 'chat_history')
  final List<ChatHistory> chatHistory;
  @JsonKey(name: 'attached_photo')
  final List<AttachedPhoto> attachedPhoto;
  Report({
    required this.reportId,
    required this.createdAt,
    required this.date,
    required this.score,
    required this.sentimentAnalysis,
    required this.reportSummary,
    required this.drawingDiary,
    required this.chatHistory,
    required this.attachedPhoto,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}

@JsonSerializable()
class SentimentAnalysis {
  final int sad;
  final int happy;
  final int expectation;
  final int soso;
  final int sick;
  final int excited;
  SentimentAnalysis({
    required this.sad,
    required this.happy,
    required this.expectation,
    required this.soso,
    required this.sick,
    required this.excited,
  });

  factory SentimentAnalysis.fromJson(Map<String, dynamic> json) =>
      _$SentimentAnalysisFromJson(json);
}

@JsonSerializable()
class ReportSummary {
  final List<String> tags;
  ReportSummary({
    required this.tags,
  });

  factory ReportSummary.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryFromJson(json);
}

@JsonSerializable()
class DrawingDiary {
  @JsonKey(name: 'image_title')
  final String imageTitle;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  DrawingDiary({
    required this.imageTitle,
    required this.imageUrl,
  });

  factory DrawingDiary.fromJson(Map<String, dynamic> json) =>
      _$DrawingDiaryFromJson(json);
}

@JsonSerializable()
class ChatHistory {
  final int id;
  final String message;
  final int index;
  @JsonKey(name: 'is_ai')
  final bool isAi;
  @JsonKey(name: 'is_image')
  final bool isImage;
  ChatHistory({
    required this.id,
    required this.message,
    required this.index,
    required this.isAi,
    required this.isImage,
  });

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);
}

@JsonSerializable()
class AttachedPhoto {
  final int id;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  AttachedPhoto({
    required this.id,
    required this.imageUrl,
  });

  factory AttachedPhoto.fromJson(Map<String, dynamic> json) =>
      _$AttachedPhotoFromJson(json);
}
