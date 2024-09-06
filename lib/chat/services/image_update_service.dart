import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/image_update_model.dart';
import 'package:me_mind/common/constant/constant.dart';

class ImageUpdateService {
  Future update(String uuid, String imageUrl) async {
    final url = "http://$ip/update-image";
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
