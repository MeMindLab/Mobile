import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:me_mind/chat/services/image_upload_service.dart';
import 'package:me_mind/report/model/create_daily/create_daily_model.dart';
import 'package:me_mind/report/services/daily_service.dart';
import 'package:me_mind/report/services/generate_image.dart';

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
      state = ReportCreateLoading(stateMsg: "레포트를 생성중입니다.");

      // 1. /report/create-daily API로 레포트 생성
      final report = await DailyService().create(id: uuid);
      if (report is! CreateDailyModel) return;
      state = ReportCreateLoading(stateMsg: "그림일기를 생성중입니다.");

      // /generate-image API로 1의 tags를 기준으로 이미지 반환
      final pictureDiary = await GenerateImage().create(tags: report.keyword);
      if (pictureDiary is! String) return;
      final newDiary = pictureDiary as String;
      print(pictureDiary);
      final directory = await getTemporaryDirectory();
      // generate-image로 생성한 이미지 다운
      // 반환받은 이미지 임시 저장소에 저장
      Dio dio = Dio();
      // final fileName = basename(newDiary);
      final fileName = newDiary.substring(87, 148);

      final filePath = '${directory.path}/download_$fileName.png';

      await dio.download(newDiary, filePath);
      // print(filePath);
      final XFile file = XFile(filePath);
      // File loadedFile = File(filePath);
      // print(loadedFile);
      // 임시 저장소에 저장된 이미지 /upload API로 업로드
      var imageUrl = await ImageUploadService().upload(File(file.path), uuid);
      print(imageUrl);

      // 레몬 1감소 실행
      // 레포트 발급 성공
      state = ReportCreateSuccess(stateMsg: "레포트 발급에 성공했습니다.");
    } catch (e) {
      state = ReportCreateFailed(stateMsg: "레포트 발급에 실패했습니다.");
      print(e);
    }

// 후 레포트 상세 페이지 이동
  }
}

abstract class ReportCreateBase {}

class ReportCreateAwaiting extends ReportCreateBase {}

class ReportCreateLoading extends ReportCreateBase {
  String stateMsg;

  ReportCreateLoading({
    required this.stateMsg,
  });
}

class ReportCreateFailed extends ReportCreateBase {
  String stateMsg;
  ReportCreateFailed({
    required this.stateMsg,
  });
}

class ReportCreateSuccess extends ReportCreateBase {
  String stateMsg;

  ReportCreateSuccess({
    required this.stateMsg,
  });
}
