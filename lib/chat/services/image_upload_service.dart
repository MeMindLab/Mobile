import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/image_upload_model.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';

class ImageUploadService {
  Future upload(File file, String uuid) async {
    const url = "http://10.0.2.2:8000/upload";
    Map<String, dynamic> queryParams = {
      'conversation_id': uuid,
      "is_drawing": true,
    };
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final dio = Dio();
    Response response;
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});

    try {
      response = await dio.post(url,
          data: formData,
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
            },
          ),
          queryParameters: queryParams);

      ImageUploadModel imageData = ImageUploadModel.fromJson(response.data);

      return imageData;
    } on DioException {
      rethrow;
      // return null;
    } catch (e) {
      return null;
    }
  }
}
