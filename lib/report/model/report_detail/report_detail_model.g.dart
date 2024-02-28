// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportDetailModel _$ReportDetailModelFromJson(Map<String, dynamic> json) =>
    ReportDetailModel(
      code: json['code'] as String,
      msg: json['msg'] as String,
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportDetailModelToJson(ReportDetailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      report: Report.fromJson(json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'report': instance.report,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      reportId: json['report_id'] as int,
      createdAt: json['created_at'] as String,
      date: json['date'] as String,
      score: json['score'] as int,
      sentimentAnalysis: SentimentAnalysis.fromJson(
          json['sentiment_analysis'] as Map<String, dynamic>),
      reportSummary: ReportSummary.fromJson(
          json['report_summary'] as Map<String, dynamic>),
      drawingDiary:
          DrawingDiary.fromJson(json['drawing_diary'] as Map<String, dynamic>),
      chatHistory: (json['chat_history'] as List<dynamic>)
          .map((e) => ChatHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachedPhoto: (json['attached_photo'] as List<dynamic>)
          .map((e) => AttachedPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'report_id': instance.reportId,
      'created_at': instance.createdAt,
      'date': instance.date,
      'score': instance.score,
      'sentiment_analysis': instance.sentimentAnalysis,
      'report_summary': instance.reportSummary,
      'drawing_diary': instance.drawingDiary,
      'chat_history': instance.chatHistory,
      'attached_photo': instance.attachedPhoto,
    };

SentimentAnalysis _$SentimentAnalysisFromJson(Map<String, dynamic> json) =>
    SentimentAnalysis(
      sad: json['sad'] as int,
      happy: json['happy'] as int,
      expectation: json['expectation'] as int,
      soso: json['soso'] as int,
      sick: json['sick'] as int,
      excited: json['excited'] as int,
    );

Map<String, dynamic> _$SentimentAnalysisToJson(SentimentAnalysis instance) =>
    <String, dynamic>{
      'sad': instance.sad,
      'happy': instance.happy,
      'expectation': instance.expectation,
      'soso': instance.soso,
      'sick': instance.sick,
      'excited': instance.excited,
    };

ReportSummary _$ReportSummaryFromJson(Map<String, dynamic> json) =>
    ReportSummary(
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReportSummaryToJson(ReportSummary instance) =>
    <String, dynamic>{
      'tags': instance.tags,
    };

DrawingDiary _$DrawingDiaryFromJson(Map<String, dynamic> json) => DrawingDiary(
      imageTitle: json['image_title'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$DrawingDiaryToJson(DrawingDiary instance) =>
    <String, dynamic>{
      'image_title': instance.imageTitle,
      'image_url': instance.imageUrl,
    };

ChatHistory _$ChatHistoryFromJson(Map<String, dynamic> json) => ChatHistory(
      id: json['id'] as int,
      message: json['message'] as String,
      index: json['index'] as int,
      isAi: json['is_ai'] as bool,
      isImage: json['is_image'] as bool,
    );

Map<String, dynamic> _$ChatHistoryToJson(ChatHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'index': instance.index,
      'is_ai': instance.isAi,
      'is_image': instance.isImage,
    };

AttachedPhoto _$AttachedPhotoFromJson(Map<String, dynamic> json) =>
    AttachedPhoto(
      id: json['id'] as int,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$AttachedPhotoToJson(AttachedPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
    };
