import 'package:json_annotation/json_annotation.dart';

part 'report_detail_model.g.dart';

@JsonSerializable()
class ReportDetailModel {
  @JsonKey(name: "report_id")
  final String? reportId;
  @JsonKey(name: "report_summary")
  final ReportSummary? reportSummary;
  final Emotions? emotions;
  @JsonKey(name: "conversation_id")
  final String? conversationId;
  @JsonKey(name: "drawing_diary")
  final DrawingDiary? drawingDiary;
  @JsonKey(name: "chat_history")
  final List<ChatHistory>? chatHistory;
  final List<String>? images;
  ReportDetailModel({
    this.reportId,
    this.reportSummary,
    this.emotions,
    this.conversationId,
    this.drawingDiary,
    this.chatHistory,
    this.images,
  });
  factory ReportDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailModelFromJson(json);
}

@JsonSerializable()
class ReportSummary {
  final String? summary;
  final List<String>? tags;
  ReportSummary({
    this.summary,
    this.tags,
  });
  factory ReportSummary.fromJson(Map<String, dynamic> json) =>
      _$ReportSummaryFromJson(json);
}

@JsonSerializable()
class DrawingDiary {
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "image_title")
  final String? imageTitle;
  DrawingDiary({
    this.imageUrl,
    this.imageTitle,
  });
  factory DrawingDiary.fromJson(Map<String, dynamic> json) =>
      _$DrawingDiaryFromJson(json);
}

@JsonSerializable()
class Emotions {
  @JsonKey(name: "comfortable_percentage")
  final double? comfortablePercentage;
  @JsonKey(name: "happy_percentage")
  final double? happyPercentage;
  @JsonKey(name: "sad_percentage")
  final double? sadPercentage;
  @JsonKey(name: "joyful_percentage")
  final double? joyfulPercentage;
  @JsonKey(name: "annoyed_percentage")
  final double? annoyedPercentage;
  @JsonKey(name: "lethargic_percentage")
  final double? lethargicPercentage;
  @JsonKey(name: "total_score")
  final double? totalScore;
  Emotions({
    this.comfortablePercentage,
    this.happyPercentage,
    this.sadPercentage,
    this.joyfulPercentage,
    this.annoyedPercentage,
    this.lethargicPercentage,
    this.totalScore,
  });

  factory Emotions.fromJson(Map<String, dynamic> json) =>
      _$EmotionsFromJson(json);
}

@JsonSerializable()
class ChatHistory {
  final String? role;
  final String? content;
  @JsonKey(name: "is_image")
  final bool? isImage;
  ChatHistory({
    this.role,
    this.content,
    this.isImage,
  });

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);
}
