import 'dart:io';

import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/image_upload_model.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';

class ImageUploadService {
  Future upload(File file) async {
    const url = "http://10.0.2.2:8000/upload";
    final data = {"file": file};

    final dio = Dio();
    Response response;
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});

    try {
      response = await dio.post(url, data: data);

      ImageUploadModel imageData = ImageUploadModel.fromJson(response.data);

      return imageData;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
