import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:me_mind/chat/model/image_update_model.dart';
import 'package:me_mind/chat/model/image_upload_model.dart';
import 'package:me_mind/chat/services/image_update_service.dart';
import 'package:me_mind/chat/services/image_upload_service.dart';
import 'package:me_mind/report/model/report_detail/report_detail_model.dart';
import 'package:me_mind/report/services/generate_image.dart';
import 'package:me_mind/report/services/report_detail_service.dart';

final reportDetailProvider = StateNotifierProvider.family<ReportDetailNotifier,
    ReportDetailState, ReportDetailParameter>((ref, params) {
  final notifier = ReportDetailNotifier(
      id: params.conversationId, reportId: params.reportId);
  return notifier;
});

class ReportDetailParameter {
  final String reportId;
  final String conversationId;
  ReportDetailParameter({
    required this.reportId,
    required this.conversationId,
  });

  ReportDetailParameter copyWith({
    String? reportId,
    String? conversationId,
  }) {
    return ReportDetailParameter(
      reportId: reportId ?? this.reportId,
      conversationId: conversationId ?? this.conversationId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ReportDetailParameter &&
        other.reportId == reportId &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode => reportId.hashCode ^ conversationId.hashCode;
}

class ReportDetailNotifier extends StateNotifier<ReportDetailState> {
  final String id;
  final String reportId;
  ReportDetailNotifier({required this.id, required this.reportId})
      : super(ReportDetailLoading()) {
    load(conversationId: id, reportId: reportId);
  }

  Future<void> load(
      {required String conversationId, required String reportId}) async {
    try {
      final response = await ReportDetailService().show(reportId: reportId);

      if (response is! ReportDetailModel) return;

      final newResponse = response as ReportDetailModel;

      if (newResponse.drawingDiary != null) {
        state = newResponse;

        return;
      } else {
        state = newResponse;

        final pictureDiary = await GenerateImage()
            .create(tags: newResponse.reportSummary!.tags!);
        print("이미지 생성");

        if (pictureDiary is! String) return;

        final directory = await getTemporaryDirectory();

        Dio dio = Dio();

        final fileName = pictureDiary.substring(87, 148);

        final filePath = '${directory.path}/download_$fileName.png';

        await dio.download(pictureDiary, filePath);

        final XFile file = XFile(filePath);

        var imageUrl = await ImageUploadService()
            .upload(File(file.path), conversationId, true);

        if (imageUrl is! ImageUploadModel) return;

        var updateResult = await ImageUpdateService()
            .update(conversationId, imageUrl.imageUrl);

        if (updateResult is! ImageUpdateModel) return;

        final result = await ReportDetailService().show(reportId: reportId);

        if (result is! ReportDetailModel) return;

        final updatedState =
            newResponse.copyWith(drawingDiary: result.drawingDiary);
        state = updatedState;
      }
    } catch (e) {
      state = ReportDetailFailed();
    }
  }
}
