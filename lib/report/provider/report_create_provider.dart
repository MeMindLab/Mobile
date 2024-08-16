import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/chat/services/image_upload_service.dart';
import 'package:me_mind/report/model/create_daily/create_daily_model.dart';
import 'package:me_mind/report/services/daily_service.dart';
import 'package:me_mind/report/services/generate_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

final reportCreateProvider =
    StateNotifierProvider<ReportCreateStateNotifier, ReportCreateBase>((ref) {
  final notifier = ReportCreateStateNotifier();
  return notifier;
});

class ReportCreateStateNotifier extends StateNotifier<ReportCreateBase> {
  ReportCreateStateNotifier() : super(ReportCreateAwaiting());

  Future create({required String uuid}) async {
    // 발급 과정

    try {
      state = ReportCreateLoading();
      // 1. /report/create-daily API로 레포트 생성
      final report = await DailyService().create(id: uuid);
      if (report is! CreateDailyModel) return;
      // /generate-image API로 1의 tags를 기준으로 이미지 반환
      final pictureDiary = await GenerateImage().create(tags: report.keyword);
      if (pictureDiary is! String) return;
      final newDiary = pictureDiary as String;

      final directory = await getTemporaryDirectory();
      // generate-image로 생성한 이미지 다운
      // 반환받은 이미지 임시 저장소에 저장
      Dio dio = Dio();
      final fileName = basename(newDiary);
      final filePath = '${directory.path}/$fileName';

      await dio.download(newDiary, filePath);

      File loadedFile = File(filePath);

      var imageUrl = await ImageUploadService().upload(loadedFile, uuid);
      print(imageUrl);
      print("임시저장소에 저장 $filePath");
    } catch (e) {
      state = ReportCreateFailed();
      print(e);
    }

// 임시 저장소에 저장된 이미지 /upload API로 업로드
// 레몬 1감소 실행
// 후 레포트 상세 페이지 이동
  }
}

abstract class ReportCreateBase {}

class ReportCreateAwaiting extends ReportCreateBase {}

class ReportCreateLoading extends ReportCreateBase {}

class ReportCreateFailed extends ReportCreateBase {}

class ReportCreateSuccess extends ReportCreateBase {}
