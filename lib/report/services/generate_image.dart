import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';

class GenerateImage {
  Future create({required List<String> tags}) async {
    final url = "http://$ip/generate-image";

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(
        url,
        data: tags,
        options: Options(
          contentType: 'application/json', // Content-Type을 명시적으로 설정
        ),
      );

      String result = response.data;
      return result;
    } catch (e) {
      return null;
    }
  }
}
