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

  // == 연산자 오버라이드
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // 동일한 객체일 경우 true
    if (other.runtimeType != runtimeType) return false; // 타입이 다르면 false
    return other is ReportDetailParameter &&
        other.reportId == reportId &&
        other.conversationId == conversationId; // 각 필드의 값이 같은지 비교
  }

  // hashCode 오버라이드
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
      print(response);
      print("report detail부르기");

      if (response is! ReportDetailModel) return;

      final newResponse = response as ReportDetailModel;

      if (newResponse.drawingDiary != null) {
        state = newResponse;
        print("굿");
        print(state);

        return;
      } else {
        // 리포트 발급 할때
        // 우선 페이지를 띄워야 하니깐 로딩
        state = newResponse;

        // /generate-image API로 1의 tags를 기준으로 이미지 반환
        final pictureDiary = await GenerateImage()
            .create(tags: newResponse.reportSummary!.tags!);
        print("이미지 생성성");
        print(pictureDiary);
        if (pictureDiary is! String) return;
        // final newDiary = pictureDiary as String;
        // print(pictureDiary);
        final directory = await getTemporaryDirectory();
        // // generate-image로 생성한 이미지 다운
        // // 반환받은 이미지 임시 저장소에 저장
        Dio dio = Dio();

        final fileName = pictureDiary.substring(87, 148);

        final filePath = '${directory.path}/download_$fileName.png';

        await dio.download(pictureDiary, filePath);

        final XFile file = XFile(filePath);

        // // 임시 저장소에 저장된 이미지 /upload API로 업로드
        var imageUrl = await ImageUploadService()
            .upload(File(file.path), conversationId, true);
        print("이미지 업로드");

        if (imageUrl is! ImageUploadModel) return;

        var updateResult = await ImageUpdateService()
            .update(conversationId, imageUrl.imageUrl);
        print("이미지 업데이트");

        if (updateResult is! ImageUpdateModel) return;

        final result = await ReportDetailService().show(reportId: reportId);
        print("다시 불러오기");

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
