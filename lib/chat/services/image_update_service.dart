import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/image_update_model.dart';

class ImageUpdateService {
  Future update(String uuid, String imageUrl) async {
    const url = "http://10.0.2.2:8000/update-image";
    Map<String, dynamic> queryParams = {
      'conversation_id': uuid,
      "image_url": imageUrl,
      "image_title": "asdf"
    };
    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, queryParameters: queryParams);

      ImageUpdateModel result = ImageUpdateModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
