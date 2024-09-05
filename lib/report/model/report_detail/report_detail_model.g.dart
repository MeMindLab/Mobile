// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDetailModel _$ReportDetailModelFromJson(Map<String, dynamic> json) =>
    ReportDetailModel(
      reportId: json['report_id'] as String?,
      reportSummary: json['report_summary'] == null
          ? null
          : ReportSummary.fromJson(
              json['report_summary'] as Map<String, dynamic>),
      emotions: json['emotions'] == null
          ? null
          : Emotions.fromJson(json['emotions'] as Map<String, dynamic>),
      conversationId: json['conversation_id'] as String?,
      drawingDiary: json['drawing_diary'] == null
          ? null
          : DrawingDiary.fromJson(
              json['drawing_diary'] as Map<String, dynamic>),
      chatHistory: (json['chat_history'] as List<dynamic>?)
          ?.map((e) => ChatHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReportDetailModelToJson(ReportDetailModel instance) =>
    <String, dynamic>{
      'report_id': instance.reportId,
      'report_summary': instance.reportSummary,
      'emotions': instance.emotions,
      'conversation_id': instance.conversationId,
      'drawing_diary': instance.drawingDiary,
      'chat_history': instance.chatHistory,
      'images': instance.images,
    };

ReportSummary _$ReportSummaryFromJson(Map<String, dynamic> json) =>
    ReportSummary(
      summary: json['summary'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReportSummaryToJson(ReportSummary instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'tags': instance.tags,
    };

DrawingDiary _$DrawingDiaryFromJson(Map<String, dynamic> json) => DrawingDiary(
      imageUrl: json['image_url'] as String?,
      imageTitle: json['image_title'] as String?,
    );

Map<String, dynamic> _$DrawingDiaryToJson(DrawingDiary instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'image_title': instance.imageTitle,
    };

Emotions _$EmotionsFromJson(Map<String, dynamic> json) => Emotions(
      comfortablePercentage:
          (json['comfortable_percentage'] as num?)?.toDouble(),
      happyPercentage: (json['happy_percentage'] as num?)?.toDouble(),
      sadPercentage: (json['sad_percentage'] as num?)?.toDouble(),
      joyfulPercentage: (json['joyful_percentage'] as num?)?.toDouble(),
      annoyedPercentage: (json['annoyed_percentage'] as num?)?.toDouble(),
      lethargicPercentage: (json['lethargic_percentage'] as num?)?.toDouble(),
      totalScore: (json['total_score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EmotionsToJson(Emotions instance) => <String, dynamic>{
      'comfortable_percentage': instance.comfortablePercentage,
      'happy_percentage': instance.happyPercentage,
      'sad_percentage': instance.sadPercentage,
      'joyful_percentage': instance.joyfulPercentage,
      'annoyed_percentage': instance.annoyedPercentage,
      'lethargic_percentage': instance.lethargicPercentage,
      'total_score': instance.totalScore,
    };

ChatHistory _$ChatHistoryFromJson(Map<String, dynamic> json) => ChatHistory(
      role: json['role'] as String?,
      content: json['content'] as String?,
      isImage: json['is_image'] as bool?,
    );

Map<String, dynamic> _$ChatHistoryToJson(ChatHistory instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'is_image': instance.isImage,
    };
