import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_mind/chat/model/image_update_model.dart';
import 'package:me_mind/chat/model/image_upload_model.dart';
import 'package:me_mind/chat/services/image_update_service.dart';
import 'package:me_mind/chat/services/image_upload_service.dart';
import 'package:me_mind/report/model/report_detail/report_detail_model.dart';
import 'package:me_mind/report/services/generate_image.dart';
import 'package:me_mind/report/services/report_detail_service.dart';
import 'package:path_provider/path_provider.dart';

final reportDetailProvider = StateNotifierProvider.family<ReportDetailNotifier,
    ReportDetailState, String>((ref, id) {
  final notifier = ReportDetailNotifier(id);
  return notifier;
});

class ReportDetailNotifier extends StateNotifier<ReportDetailState> {
  final String id;
  ReportDetailNotifier(this.id) : super(ReportDetailLoading()) {
    load(id);
  }

  Future<void> load(
    String id,
  ) async {
    try {
      final response = await ReportDetailService().show(conversationId: id);
      print("report detail부르기");

      if (response is! ReportDetailModel) return;

      final newResponse = response as ReportDetailModel;

      if (newResponse.drawingDiary != null) {
        state = newResponse;

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
        var imageUrl =
            await ImageUploadService().upload(File(file.path), id, true);
        print("이미지 업로드");

        if (imageUrl is! ImageUploadModel) return;

        var updateResult =
            await ImageUpdateService().update(id, imageUrl.imageUrl);
        print("이미지 업데이트");

        if (updateResult is! ImageUpdateModel) return;

        final result = await ReportDetailService().show(conversationId: id);
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
