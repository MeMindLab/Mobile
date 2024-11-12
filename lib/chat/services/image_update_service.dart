import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/image_update_model.dart';
import 'package:me_mind/common/constant/constant.dart';

class ImageUpdateService {
  Future update(String uuid, String imageUrl) async {
    final url = "$ip/update-image";
    Map<String, dynamic> queryParams = {
      'conversation_id': uuid,
      "image_url": imageUrl,
      "image_title": "asdf"
    };
    final dio = Dio();
    Response response;
    dio.options.headers.clear();
    dio.options.headers.addAll({
      'accept': 'application/json',
    });

    try {
      response = await dio.post(url, queryParameters: queryParams);

      ImageUpdateModel result = ImageUpdateModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
