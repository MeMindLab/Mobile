import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/image_upload_model.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';

class ImageUploadService {
  Future upload(File file, String uuid, bool isDrawing) async {
    final url = "$ip/upload";

    Map<String, dynamic> queryParams = {
      'conversation_id': uuid,
      "is_drawing": isDrawing,
    };
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: fileName),
    });
    final dio = Dio();
    Response response;
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers
        .addAll({'accessToken': true, 'accept': 'application/json'});

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
