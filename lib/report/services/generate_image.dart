import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';

class GenerateImage {
  Future create({required List<String> tags}) async {
    final url = "$ip/generate-image";

    final dio = Dio();
    Response response;
    dio.options.headers.clear();
    dio.options.headers.addAll({'accept': "application/json"});

    try {
      response = await dio.post(
        url,
        data: tags,
        options: Options(
          contentType: 'application/json',
        ),
      );

      String result = response.data["image_url"];

      return result;
    } catch (e) {
      return null;
    }
  }
}
